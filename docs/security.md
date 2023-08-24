# Safety, Security, and Governance for Generative AI Based Systems

## Introduction

OWASP recently released their [top 10](https://owasp.org/www-project-top-10-for-large-language-model-applications/) vulnerabilities for large language models (LLMs). Some of these are familiar from previous decades of software security work (e.g. denial-of-service attacks, injection attacks, insufficient access control).  Others are unique to AI based system (e.g. training data poisoning or excessive agency).  Even when these are familiar vulnerability patterns, they often have exploit paths and outcomes that are unique to AI-based systems.  For example, a traditional protection against data exfiltration attacks is to implement an authentication system that restricts access to sensitive data.  This is not always possible with generative AI-based systems (GAI systems), where anyone who can generate a model query may be able to extract training data.

In this paper we review terms such as "safety" and "security" and cover their application to AI-based software systems.  We also review recent results regarding LLM vulnerabilities and based on this set forth expectations that systems engineers should have as they design systems that incorporate AI.  Based on these expectations, we present some best practices for architecting secure AI-based systems and emphasize the importance of defense in depth.  Finally we discuss governance frameworks for AI-based systems so that compliance with these best practices can be checked.

## Safety vs Security

Definitions of safety and security vary, and security issues can often lead to safety issues.  For the purposes of this discussion, we want to be precise about the meaning of these terms, so we will adopt the following definitions. We also define *resilience* another desireable system property. Note that safety and security differ in their *threat models*. All definitions rely on a notion of *desireable outcome* which is difficult to specify for traditional systems and even less feasible for GAI systems.  There are some common methods for approximately describing desireable outcomes that we cover in the Governance section.

**Safety**: 
**Security**: 
**Resilience**: 

## Setting Expectations

## Architecting for Security

## Defense in Depth

## Governance

**Note: Remember to talk about specifying outcome expectations.**

## Conclusion
