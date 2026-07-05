---
name: debug-reset
description: Belief-reset protocol for stuck debugging. Use IMMEDIATELY whenever two consecutive fix attempts or hypotheses for the same bug have failed, whenever you notice you are patching symptoms (adding retries, timeouts, sleeps) without a verified root cause, or whenever the user says you are going in circles. Do not attempt a third fix from the same theory without running this first.
---

# Debug Reset

You are here because two hypotheses died. The most likely reason is not bad
luck — it is that something you believe about this system is false. This
protocol exists to find and kill that belief, cheaply imitating what a fresh
mind would do.

## Steps

1. **Freeze.** No more code edits until step 5.

2. **Write the evidence table.** Two lists, in your working notes:
   - VERIFIED: only facts you personally confirmed THIS session, each with the
     command or observation that proves it.
   - BELIEVED: everything else you have been assuming — including the "obvious"
     things: which service is actually being hit, which config file is actually
     loaded, which version is actually deployed, whether the test you ran even
     covers the code path.
   Anything based on memory, docs, or someone else's report goes in BELIEVED.

3. **Attack BELIEVED, cheapest first.** For each assumption, design the fastest
   check that could falsify it: print the actual URL being hit, log the loaded
   config path, check the deployed sha, add a tracer that proves the path
   executes. Most stuck bugs die here — a BELIEVED item turns out to be false.

4. **Re-ask the question.** Given only VERIFIED facts: is the original framing
   even right? "Retry or timeout?" dissolves when the verified fact is "wrong
   endpoint". If the frame was wrong, say so explicitly and restate the real
   problem before touching code.

5. **One new hypothesis, pre-committed test.** From VERIFIED facts only, form a
   single hypothesis. State — BEFORE testing — what result would confirm it and
   what would refute it. Then test.

6. **Escalate on the second reset.** If this protocol has already run once for
   this bug and you are back here: stop. Write a handoff containing the
   VERIFIED facts, the hypotheses killed, and the falsifying checks you ran.
   Give it to the human. That handoff is a deliverable, not a failure.
