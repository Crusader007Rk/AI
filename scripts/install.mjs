import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const sourceRoot = path.resolve(__dirname, '..');

const destinationRoot = process.env.VSCODE_USER_PROMPTS_FOLDER || path.join(process.env.APPDATA || '', 'Code', 'User', 'prompts');

const agentsSource = path.join(sourceRoot, 'agents');
const skillsSource = path.join(sourceRoot, 'skills');
const targetAgents = path.join(destinationRoot, 'agents');
const targetSkills = path.join(destinationRoot, 'skills');

fs.mkdirSync(targetAgents, { recursive: true });
fs.mkdirSync(targetSkills, { recursive: true });

for (const entry of fs.readdirSync(agentsSource, { withFileTypes: true })) {
  if (entry.isFile() && entry.name.endsWith('.md')) {
    fs.copyFileSync(path.join(agentsSource, entry.name), path.join(targetAgents, entry.name));
  }
}

for (const entry of fs.readdirSync(skillsSource, { withFileTypes: true })) {
  if (!entry.isDirectory()) continue;

  const skillDir = path.join(skillsSource, entry.name);
  const skillFile = path.join(skillDir, 'SKILL.md');
  if (fs.existsSync(skillFile)) {
    const targetSkillDir = path.join(targetSkills, entry.name);
    fs.mkdirSync(targetSkillDir, { recursive: true });
    fs.copyFileSync(skillFile, path.join(targetSkillDir, 'SKILL.md'));
  }
}

console.log(`Installed agents and skills into ${destinationRoot}`);
