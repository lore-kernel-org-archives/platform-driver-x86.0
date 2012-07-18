From: =?UTF-8?B?TWlndWVsIEfDs21leg==?= <magomez@igalia.com>
Subject: Re: [PATCH 1/1 v2] classmate-laptop: Add support for Classmate V4
 accelerometer.
Date: Wed, 18 Jul 2012 15:53:48 +0200
Message-ID: <5006BFEC.1010407@igalia.com>
References: <cover.1340976795.git.magomez@igalia.com> <39ac42c709e498fbef4f0f0f24edc5331e5f4473.1340976795.git.magomez@igalia.com> <20120717224749.GA20813@nautilus.holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp3.mundo-r.com ([212.51.32.191]:62398 "EHLO
	smtp4.mundo-r.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751276Ab2GRNxw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 Jul 2012 09:53:52 -0400
In-Reply-To: <20120717224749.GA20813@nautilus.holoscopio.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: don@syst.com.br, mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> On Fri, Jun 29, 2012 at 03:39:48PM +0200, Miguel G=C3=B3mez wrote:
>> Classmate V4 laptop includes a new accelerometer that can't be handl=
ed by
>> previous driver. This patch adds a new driver to handle it.
>>
>> Signed-off-by: Miguel G=C3=B3mez <magomez@igalia.com>
>
> Hi, Miguel.
>
> This seems OK to me. Thanks for this work. Do you have the other
> functionality of the driver working? I am interested to know if you h=
ave
> the function buttons working.

Hi Thadeu

I've been giving a look to the buttons code. Currently they are not=20
working because the hardware id reported by the device (FNBT0000) is no=
t=20
the same as the one defined by the driver (FnBT0000), as you an one of=20
my colleagues commented in this thread:

https://lkml.org/lkml/2011/6/21/341

I've replaced the id in the driver to FNBT0000 and it made the buttons=20
work like a charm (enabling control of the backlight and LAN as well).=20
To ensure compatibility with older versions of the kernel, a new id can=
=20
be added (FNBT0000) besides the existent one (FnBT0000), and that works=
=20
as well (as proposed in the thread).

It seems that this problem got a bit forgotten in the lists. Quoting=20
yourself from the last email in the thread:

> I am copying the acpi list and Len Brown to see if they can tell us
> which one should be the right solution:
>
> 1) reverting the patch in acpica that puts all names in uppercase
> 2) using a case-insensitive match in acpi bus driver
> 3) using uppercase name in classmate-laptop driver

I think the easiest and less risky way to fix this is by adding a new=20
hardware id (as proposed in the thread's patch), as it doesn't add any=20
side effects (that the other solutions might add), and it doesn't break=
=20
the behaviour of the old code.

What do you think?

Regards!

--=20
Miguel G=C3=B3mez
Igalia - http://www.igalia.com
