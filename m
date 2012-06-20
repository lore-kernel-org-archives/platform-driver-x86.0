From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: Need help regarding the USB mass storage driver
Date: Wed, 20 Jun 2012 12:12:11 +0200
Message-ID: <20120620121211.3eb93149@skate>
References: <CAKB833nfHQwdHzCFV6ELrk1-XZT-SN8WxMs=kzO=C8+6foTrDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKB833nfHQwdHzCFV6ELrk1-XZT-SN8WxMs=kzO=C8+6foTrDQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vishal Nandanwar <operational.people@gmail.com>
Cc: Linux Docs <linux-doc@vger.kernel.org>, Linux Embedded Group <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux USB <linux-usb@vger.kernel.org>, Platform driver x86 <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Le Wed, 20 Jun 2012 15:09:20 +0530,
Vishal Nandanwar <operational.people@gmail.com> a =C3=A9crit :

> I am working on a USB mass storage driver for a pen drive. I have don=
e
> coding as per the USB_skeleton.c file provided in Linux 3.2 source
> code. I could assign the driver to pen drive when pen driver is
> inserted in USB connector.

Why do you need to write a new driver?

Normally, all the USB storage devices conform to the USB Mass Storage
specification, which means that the usb-storage driver of the Linux
kernel can be used for them. There is no need for a separate driver for
each USB storage device, unless of course it doesn't comply with the
USB Mass Storage specification.

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
