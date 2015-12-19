From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/4] asus-wrc: Add ACPI HID ATK4001
Date: Fri, 18 Dec 2015 22:40:47 -0800
Message-ID: <20151219064047.GE7244@malice.jf.intel.com>
References: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
 <1450193442-7930-3-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45784 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753278AbbLSGks (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Dec 2015 01:40:48 -0500
Content-Disposition: inline
In-Reply-To: <1450193442-7930-3-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>

On Tue, Dec 15, 2015 at 10:30:40AM -0500, Jo=E3o Paulo Rechi Vita wrote=
:
> As reported in https://bugzilla.kernel.org/show_bug.cgi?id=3D98931#c2=
2 in
> the Asus UX31A the "Asus Wireless Radio Control" device (ASHS) uses t=
he
> HID "ATK4001".

Do you happen to have an ASL dump of this ID? Does it differ in any sig=
nificant
way?

>=20
> Signed-off-by: Jo=E3o Paulo Rechi Vita <jprvita@endlessm.com>
> Reported-by: Tasev Nikola <tasev.stefanoska@skynet.be>
> ---
>  drivers/platform/x86/asus-wrc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/asus-wrc.c b/drivers/platform/x86/a=
sus-wrc.c
> index 13a2022..941ad73 100644
> --- a/drivers/platform/x86/asus-wrc.c
> +++ b/drivers/platform/x86/asus-wrc.c
> @@ -96,6 +96,7 @@ static int asus_wrc_remove(struct acpi_device *devi=
ce)
>  }
> =20
>  static const struct acpi_device_id device_ids[] =3D {
> +	{"ATK4001", 0},
>  	{"ATK4002", 0},
>  	{"", 0},
>  };
> --=20
> 2.5.0
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
Darren Hart
Intel Open Source Technology Center
