From: Lukasz Majewski <majess1982@gmail.com>
Subject: [Vortex86] Vortex86DX SoC - HIGH_RESOLUTION_TIMER
Date: Tue, 12 Apr 2011 21:27:39 +0200
Message-ID: <20110412212739.5658f030@mig>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-8086-owner@vger.kernel.org>
Sender: linux-8086-owner@vger.kernel.org
To: Lukasz Majewski <majess1982@gmail.com>
Cc: linux-embedded@vger.kernel.org, linux-8086@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi all,

I'd like to kindly ask for some help with my embedded system.

I'm using the Vortex86DX SoC (it's a x86 32 clone) on my PC104 board.

I've managed to apply and run the 2.6.33.7.2-rt30 RT linux.

It supports the full preemption (PREEMPT_RT enabled).

I've run the cyclictest (preemption tests) and then I've realized, that
the HIGH_RESOLUTION_TIMER is not supported on this SoC (yet... I
hope :-) ).

Moreove the low-res counter resolution is 1ms (as shown at
cat /proc/timer_list), which is unacceptable for my application.=20

I've searched deeper in the specification of this SoC and I've found,
that the Vortex86DX supports two i8254 timers. One is used for DMA,
interrupt controller and disk, but the second seems to be free :-).

root@lukma:~# cat /proc/ioports=20
0000-001f : dma1
0020-0021 : pic1
0040-0043 : timer0
0050-0053 : timer1 -> for use?


In the i8254 specification it is written, that it is possible to feed
the counter with 10MHz, which would be sufficient.=20

I've poked around in the 2.6.33.7.2-rt30 source code and I've found,
that mostly the COMEDI "staged driver" supports this chip. It looks
that this driver has some issues and should not be used (it looks
rather old).

I have got following questions:
1. It seems, that i8254/53 is in some kind standard timer chip (like
8237 - DMA chip) and should already HAVE driver (for x86 i386, i486,
i586).

2. It should be possible to use it as a source for HIGH RESOLUTION
TIMER to provide 1/10 MHz =3D 100 ns resolution. (for me 1us is enough)=
=2E
I suppose, that "only" proper callbacks should be provided for
HIGH_RESOLUTION_TIMER framework.

3. It should be a common problem for x86 arch clones (in the
embedded world) to provide one or other source for HIGH RESOLUTION
TIMERS to achieve proper schedule timing.=20

How this problem is tackled on the other x86 variants? There MUST be
either Local Advanced Programmable Interrupt Controller (Local APIC) or
High Precision Event Timer. The vortex86DX SoC has 800MHz clock
freq, so 1us timer precision shall be achievable.=20
What is the clock source for High Resolution Timers on other processors
with up to i586 ISA?


4. I'd be glad to have an opportunity to solve this problem (I mean to
write a driver for i8254) but I don't want to reinvent the wheel :-)

Any help/ideas/hints are very welcome. I've got some experience with
ARM/PXA cores, so x86 SoC is somewhat new for my real-time, embedded
adventure.


Thanks in advance and regards,
=C5=81ukasz Majewski
--
To unsubscribe from this list: send the line "unsubscribe linux-8086" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
