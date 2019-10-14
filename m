From: "Guilherme G. Piccoli" <gpiccoli-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Advice on oops - memory trap on non-memory access instruction
	(invalid CR2?)
Date: Mon, 14 Oct 2019 00:32:38 -0300
Message-ID: <66eeae28-bfd3-c7a0-011c-801981b74243@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, mfo-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, gpiccoli-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, ioanna-maria.alifieraki-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, jay.vosburgh-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, gavin.guo-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hello kernel community, I'm investigating a recurrent problem, and
hereby I'm seeking some advice - perhaps anybody reading this had
similar issue, for example. I've iterated some mailing-lists I thought
would be of interest, apologize if I miss any or if I shouldn't have
included some.

We have a kernel memory oops due to invalid read/write, but the trap
happens in a non-memory access instruction.

Example in [0] below. We can see a read access to offset 0x458, while it
seems KVM was sending IPI. The "Code" line though (and EIP analysis with
objdump in the vmlinux image) shows the trapping instruction as:

2b:*84 c0 test %al,%al <-- trapping instruction

This instruction clearly shouldn't trap by invalid memory access. Also,
this 0x458 offset seems not present in the code, based on assembly
analysis done [1]. We had 3 or 4 more reports like this, some have
invalid address on write (again #PF), some #GP - in all of them, the
trapping insn is a non-memory related opcode.

We understand x86 (should) have precise exceptions, so some hypothesis
right now are related with:

(a) Invalid CR2 - perhaps due to a System Management Interrupt, firmware
code executed and caused an invalid memory access, polluting CR2.

(b) Error in processor - there are some errata on Xeon processors, which
Intel claims never were observed in commercial systems.

(c) Error in kernel reporting when the oops happens - though we
investigate this deeply, and the exception handlers are quite concise
assembly routines that stacks processor generated data.

(d) Some KVM/vAPIC related failure that may be caused by guest MMAPed
APIC area bad access during interrupt virtualization.

(e) Intel processor do not present precise interrupts.

All of them are unlikely - maybe I'm not seeing something obvious, hence
this advice request. Below there's a more detailed analysis of the
registers of the aforementioned oops splat [2].

We are aware of the old version of kernel, unfortunately the user
reporting this issue is unable to update right now. Any
direction/suggestion/advice to obtain more data or prove/disprove some
of our hypothesis is highly appreciated. Any questions are also
appreciated, feel free to respond with any ideas you might have.

Thanks,


Guilherme
--


[0]
BUG: unable to handle kernel NULL pointer dereference at 0000000000000458
IP: [<ffffffffc079baf6>] kvm_irq_delivery_to_apic+0x56/0x220 [kvm]
PGD 0
Oops: 0000 [#1] SMP
Modules linked in: <...>
CPU: 40 PID: 78274 Comm: qemu-system-x86 Tainted: P W  OE
4.4.0-45-generic #66~14.04.1-Ubuntu
Hardware name: Dell Inc. PowerEdge R630/02C2CP, BIOS 2.1.7 06/16/2016
task: ffff8800594dd280 ti: ffff880169168000 task.ti: ffff880169168000
RIP: 0010:[<ffffffffc079baf6>]  [<ffffffffc079baf6>]
kvm_irq_delivery_to_apic+0x56/0x220 [kvm]
RSP: 0018:ffff88016916bbe8  EFLAGS: 00010282
RAX: 0000000000000001 RBX: 0000000000000300 RCX: 0000000000000003
RDX: 0000000000000040 RSI: 0000000000000010 RDI: ffff88016916bba8
RBP: ffff88016916bc30 R08: 0000000000000004 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 00000000000008fd
R13: 0000000000000004 R14: ffff88004d3e8000 R15: ffff88016916bc40
FS:  00007fbd67fff700(0000) GS:ffff881ffeb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000458 CR3: 00000001961a9000 CR4: 00000000003426e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Stack:
 0000000000000001 0000000000000000 ffff882194b81400 0000000194b81410
 0000000000000300 00000000000008fd 0000000000000004 ffff882194b81400
 0000000000000001 ffff88016916bc78 ffffffffc0796d20 08000000000000fd
Call Trace:
 [<addr>] apic_reg_write+0x110/0x5f0 [kvm]
 [<addr>] kvm_apic_write_nodecode+0x4b/0x60 [kvm]
 [<addr>] handle_apic_write+0x1e/0x30 [kvm_intel]
 [<addr>] vmx_handle_exit+0x288/0xbf0 [kvm_intel]
 [<addr>] vcpu_enter_guest+0x8b4/0x10a0 [kvm]
 [<addr>] ? kvm_vcpu_block+0x191/0x2d0 [kvm]
 [<addr>] ? prepare_to_wait_event+0xf0/0xf0
 [<addr>] kvm_arch_vcpu_ioctl_run+0xc4/0x3d0 [kvm]
 [<addr>] kvm_vcpu_ioctl+0x2ab/0x640 [kvm]
 [<addr>] do_vfs_ioctl+0x2dd/0x4c0
 [<addr>] ? __audit_syscall_entry+0xaf/0x100
 [<addr>] ? do_audit_syscall_entry+0x66/0x70
 [<addr>] SyS_ioctl+0x79/0x90
 [<addr>] entry_SYSCALL_64_fastpath+0x16/0x75
Code: d4 ff ff ff ff 75 0d 81 7a 10 ff 00 00 00 0f 84 7d 01 00 00 4c 8b
45 c0 48 8b 75 c8 48 8d 4d d4 4c 89 fa 4c 89 f7 e8 ca be ff ff <84> c0
0f 85 0c 01 00 00 41 8b 86 f0 09 00 00 85 c0 0f 8e fd 00
RIP  [<ffffffffc079baf6>] kvm_irq_delivery_to_apic+0x56/0x220 [kvm]
RSP <ffff88016916bbe8> CR2: 0000000000000458
--


[1] Assembly analysis: https://pastebin.ubuntu.com/p/hdHNmvFtd8/
--


[2] More detailed analysis of registers:

%rax = 1 [return from kvm_irq_delivery_to_apic_fast()]

%rbx = 0x300 [ICR_LO register - this value comes from
kvm_apic_write_nodecode(), in which the offset / register is assigned to
%ebx.

%rdi = &bitmap
%rsi = 16 (0x10) from "for_each_set_bit(i, &bitmap, 16)" in function
kvm_irq_delivery_to_apic_fast().

%rcx = i in above loop
%rdx = 64 (0x40 - BITS_PER_LONG, set inside find_next_bit() in the above
loop)

%r8 = 4 ->  accumulates the return of kvm_apic_set_irq() - it means 4
IRQs were delivered successfully. It could have been zeroed in the
process, and IRQs that were discarded don't accumulate here, so the
value doesn't say much.

%r14 = (struct kvm*) apic->vcpu->kvm
%r15 = (kvm_lapic_irq*) irq [stack-like addr, as it came from
apic_send_ipi(), in which irq is declared in stack - from the stack
dump, it is 0xffffffffc0796d20]

%r12 = apic->regs[ICR_LO] -> important register, describes the IPI data;
value of 0x8fd means:

bits 0-7 (vector): 253
bits 8-10 (delivery mode): 0 -> fixed
bit 11 (destination logic): 1 -> logical
bit 12 (delivery status): 0 -> idle
bit 14 (level): 0 -> De-assert [oddity: Intel SDM vol 3 (10.6.1) claims
this should be 1 in Xeon processors]
bit 15 (trigger mode): 0 -> Edge
bits 18-19 (shorthand): No

%r13 = irq.dest_id == apic->regs[ICR_HI] / some transformation of this
register <it's a xapic system, not x2apic>
