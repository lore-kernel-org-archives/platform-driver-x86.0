From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: Add Asus Wireless Radio Control driver
Date: Sun, 20 Dec 2015 11:58:50 -0500
Message-ID: <CA+A7VXXiQx5D8Q-Wmus4EdA1Y6voPOan+EubABXEhkHMK6+bXg@mail.gmail.com>
References: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
 <1450193442-7930-2-git-send-email-jprvita@endlessm.com> <20151219063957.GD7244@malice.jf.intel.com>
 <CA+A7VXWGTAsen2V29ifJ9nGCuHRnQnZi=Q_oEi1fkmeo=t1gxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f196.google.com ([209.85.160.196]:34635 "EHLO
	mail-yk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753219AbbLTQ7a convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Dec 2015 11:59:30 -0500
Received: by mail-yk0-f196.google.com with SMTP id n23so9895280yke.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Dec 2015 08:59:30 -0800 (PST)
In-Reply-To: <CA+A7VXWGTAsen2V29ifJ9nGCuHRnQnZi=Q_oEi1fkmeo=t1gxQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 19 December 2015 at 01:39, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Dec 15, 2015 at 10:30:39AM -0500, Jo=C3=A3o Paulo Rechi Vita =
wrote:
>> Some Asus notebooks like the Asus E202SA and the Asus X555UB have a
>> separate ACPI device for notifications from the airplane mode hotkey=
=2E
>> This device is called "Wireless Radio Control" in Asus websites and =
ASHS
>> in the DSDT, and its ACPI _HID is ATK4002 in the two models mentione=
d
>> above.
>>
>> For these models, when the airplane mode hotkey (Fn+F2) is pressed, =
a
>> query 0x0B is started in the Embedded Controller, and all this query=
 does
>> is a notify ASHS with the value 0x88 (for acpi_osi >=3D "Windows 201=
2"):
>>
>> Scope (_SB.PCI0.SBRG.EC0)
>> {
>> (...)
>> Method (_Q0B, 0, NotSerialized) // _Qxx: EC Query
>> {
>> If ((MSOS () >=3D OSW8))
>> {
>> Notify (ASHS, 0x88) // Device-Specific
>> }
>> Else
>> {
>> (...)
>> }
>> }
>> }
>>
>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
>
> Hi Joao,
>
> Nice work!
>
> In the future, [please be sure to include all the maintainers listed =
by
> get_maintainer.pl when submitting patches for review.
>
> No concerns from me on this portion of the series.
>

Great news, thank you! I'll make sure to check get_maintainer.pl for my=
 next
submissions, I have not worked with that script before.

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
