From: Johannes Stezenbach <js@sig21.net>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Tue, 12 Jan 2016 23:07:15 +0100
Message-ID: <20160112220715.GA13350@sig21.net>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali>
 <20160111211228.GA4171@sig21.net>
 <1452614830.376787.489968026.5FAEDB86@webmail.messagingengine.com>
 <20160112163514.GA24900@sig21.net>
 <1452621367.403228.490087522.151796A7@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452621367.403228.490087522.151796A7@webmail.messagingengine.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Pavel Machek <pavel@ucw.cz>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 12, 2016 at 03:56:07PM -0200, Henrique de Moraes Holschuh wrote:
> On Tue, Jan 12, 2016, at 14:35, Johannes Stezenbach wrote:
> > But what to look out for?
> 
> Well, you should familiarize yourself with ACPI AML a bit. Then, look
> for the ACPI methods that thinkpad-acpi (and the patch to add backlight
> support) calls, and try to work out how they work in your thinkpad.
> 
> Typical thinkpad firmware behavior is to sometimes have a lower level
> implementation, a higher level ACPI API that the O.S. is supposed to
> call (and which will call into the lower level implementation, or to the
> work itself).
> 
> We want to stick to the higher level API, as it is more stable.  Use of
> lower-level APIs or direct EC access must be whitelist-restricted.

So if I interpret this correctly it calls SMI BIOS on x230, too:

                        Method (MLCG, 1, NotSerialized)
                        {
                            Local0 = \KBLS (0x00, 0x00)
                            Return (Local0)
                        }

                        Method (MLCS, 1, NotSerialized)
                        {
                            Local0 = \KBLS (0x01, Arg0)
                            If (!(Local0 & 0x80000000))
                            {
                                If ((Arg0 & 0x00010000))
                                {
                                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6001)
                                }
                                ElseIf (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x00020000))
                                {
                                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1012)
                                }
                            }

                            Return (Local0)
                        }


    Method (KBLS, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x09, Arg0, Arg1, 0x00))
    }

FWIW, full dump is here:
https://linuxtv.org/~js/ahSheaw0eezahqu1aethohLae4MeiPhe/

Johannes
