From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/2] ACER: Add support for ambient light sensor
Date: Tue, 5 Jun 2012 14:49:13 +0200
Message-ID: <CAHR064jYAFd06VYZvi90xZCyJCKEmEdKkmrim9mEn584CqRmzw@mail.gmail.com>
References: <1338570683-16491-1-git-send-email-marex@denx.de>
	<1338570683-16491-2-git-send-email-marex@denx.de>
	<CAHR064hJquR4AF6iZNyJTpK5f9GOBHfMq33Y=XpD7ZtFVW1E4A@mail.gmail.com>
	<201206041914.00536.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:65250 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751134Ab2FEMtO convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jun 2012 08:49:14 -0400
Received: by bkcji2 with SMTP id ji2so4553908bkc.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Jun 2012 05:49:13 -0700 (PDT)
In-Reply-To: <201206041914.00536.marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: platform-driver-x86@vger.kernel.org, joeyli <jlee@suse.com>, "Zhang, Rui" <rui.zhang@intel.com>, Len Brown <len.brown@intel.com>

On Mon, Jun 4, 2012 at 7:14 PM, Marek Vasut <marex@denx.de> wrote:
> Dear Corentin Chary,
>
>> On Fri, Jun 1, 2012 at 7:11 PM, Marek Vasut <marex@denx.de> wrote:
>> > This is the ambient light sensor found on Iconia W500.
>> >
>> > Signed-off-by: Marek Vasut <marex@denx.de>
>> > Cc: joeyli <jlee@suse.com>
>> > ---
>
> [...]
>
>> > +static int __init acer_wmi_alsd_setup(void)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 int err;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 err =3D acer_wmi_get_handle("ALSD", "ACPI00=
08", &alsd_handle);
>> > + =C2=A0 =C2=A0 =C2=A0 if (err)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;
>>
>> NACK !
>
> What are you trying to achieve with such attitude? Are you trying to =
show off
> how much you can scream at someone new? I'd tell you some really hars=
h words and
> would turn my back on all this linux stuff if I wasn't used to people=
 in kernel
> mailing lists having quite weird manners sometimes.

Sorry, that really wasn't what I meant. ACK / NACK are traditionnaly
written like this arround here, but the "!" was probably too much.

>
>> This is a generic device, and should be handled by ACPI core
>> (Samsung laptop have this too). See "ACPI ALS" on linux-acpi.
>
> Saying this would be enough. Lee explained to me what this ACPI0008 m=
eans, I'm
> quite new to the ACPI land so pardon my ignorance here. But it then b=
oils down
> to Lee's question, why wasn't the patch for ACPI ALS that was already=
 proposed
> accepted? And what can be done to get it in?

Yep, I've seen Lee's message latter. Regarding ACPI ALS status, it was
forgotten for a long time, and recently Zhang Rui told that he will
take another look at it, but nothing sure. If you want to know more
about the status, you can do a quick search on gmane using "ACPI ALS"
query on linux.acpi


--=20
Corentin Chary
http://xf.iksaif.net
