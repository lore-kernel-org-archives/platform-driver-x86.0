From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [PATCH V2 2/2] thinkpad_acpi: Convert printks to pr_<level>
Date: Mon, 4 Apr 2011 20:14:05 +0200
Message-ID: <BANLkTimEt32ZOjNRd4h2uXd1Z-8W6yfg_Q@mail.gmail.com>
References: <664bf5e5585f3d959d6c57524d09353dd8d49f3f.1301936559.git.joe@perches.com>
	<20110404130036.GB16669@srcf.ucam.org>
	<c428cc13a1a5953be3310237e4f404ec65968d5a.1301936559.git.joe@perches.com>
	<BANLkTinKXtiNE=4xfNMh+nJBpiYUYFNRZQ@mail.gmail.com>
	<1301940613.1941.50.camel@Joe-Laptop>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:37376 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754960Ab1DDSOG convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Apr 2011 14:14:06 -0400
In-Reply-To: <1301940613.1941.50.camel@Joe-Laptop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Matthew Garrett <mjg@redhat.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Stephen Rothwell <sfr@canb.auug.org.au>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Apr 4, 2011 at 8:10 PM, Joe Perches <joe@perches.com> wrote:
> On Mon, 2011-04-04 at 20:03 +0200, Sedat Dilek wrote:
>> On Mon, Apr 4, 2011 at 7:06 PM, Joe Perches <joe@perches.com> wrote:
>> > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platfo=
rm/x86/thinkpad_acpi.c
>> [...]
>> > =C2=A0#ifdef CONFIG_THINKPAD_ACPI_DEBUG
>> > =C2=A0#define vdbg_printk dbg_printk
>> > =C2=A0static const char *str_supported(int is_supported);
>> > =C2=A0#else
>> > -#define vdbg_printk(a_dbg_level, format, arg...) \
>> > - =C2=A0 =C2=A0 =C2=A0 do { } while (0)
>> > +static inline const char *str_supported(int is_supported) { retur=
n ""; }
>> > +#define vdbg_printk(a_dbg_level, format, arg...) =C2=A0 =C2=A0 =C2=
=A0 \
>> > + =C2=A0 =C2=A0 =C2=A0 no_printk(format, ##arg)
>> > =C2=A0#endif
>>
>> Should be...
>> + =C2=A0 =C2=A0 =C2=A0 do { } while (0)
>> ...not...
>> + =C2=A0 =C2=A0 =C2=A0 no_printk(format, ##arg)
>
> I disagree. =C2=A0No printk serves as a mechanism to verify
> printk arguments when !CONFIG_THINKPAD_ACPI_DEBUG.
>

Oops sorry, now I see you have chosen solution #1 :-).

- Sedat -
