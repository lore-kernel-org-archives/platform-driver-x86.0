From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: ThinkPad Yoga 370 thinkpad_acpi unhandled events
Date: Thu, 15 Feb 2018 16:21:20 -0200
Message-ID: <20180215182120.vj2evutyvixjzf55@khazad-dum.debian.net>
References: <PqonyRG1_zESPTDspqzZ2qO65lHbv5E1z8Ekcgrzh0TtbBmlm69BnfUqZIEuSbF-d1z0VeXHPMRRCQenBEMNP2L8NyTqvIui1FwdHnJ6RAc=@protonmail.ch>
 <ei0r_oTyOQrFrZKDqLMWzJHdipDsPEu8zxZxhnNuNa6L7TMRdZzu43Ldx0mcuOiRI2Ud-Lx746lfMG-9YpGR7vcp1HrsuroruKEWzhrr3dg=@protonmail.ch>
 <FA1DB435B97D5A4192BAE54A4EA542A99ABEF68F@CNMAILEX04.lenovo.com>
 <CAHp75VdbmP_a37-7qkacx=k21XzCjki=qFC0_eWk=L952u0Pbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:44733 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1163088AbeBOSV2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Feb 2018 13:21:28 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VdbmP_a37-7qkacx=k21XzCjki=qFC0_eWk=L952u0Pbw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Peter FP1 Zhang <zhangfp1@lenovo.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Jordan Glover <Golden_Miller83@protonmail.ch>, Christian Kellner <ckellner@redhat.com>, "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "bberg@redhat.com" <bberg@redhat.com>

On Thu, 15 Feb 2018, Andy Shevchenko wrote:
> (Luckily entire discussion is kept in this mail)
> 
> On Thu, Feb 1, 2018 at 4:07 AM, Peter FP1 Zhang <zhangfp1@lenovo.com> wrote:
> > Dear all,
> >
> > I was told by our BIOS/Thermal team that the two events are designed for Windows OS, for Linux we can just ignore them directly.

The patch to do that is quite trivial, would anyone like to try his/her
hand at it?  There are examples already in the thinkpad-acpi code of
events we ignore...

Although it would have been nice to know what these events actually mean
and what they hint the windows drivers to do, since we might have wanted
to leverage them in Linux userspace as well :p

> > 0x60F0  HK_THERMAL_TRANSFORMATION_CHANGED,  ASL method is GTMS
> > 0x6032  HK_DYNAMIC_THERMAL_CONTROL_SET_COMMAND_COMPLIETION,  ASL method is DYTC

-- 
  Henrique Holschuh
