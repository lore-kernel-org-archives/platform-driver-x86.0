Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057903FBEC7;
	Mon, 11 May 2026 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514616; cv=pass; b=Cgu6SY8MTt0HY1FhMNF9DTBh8kwSTpk1oftsMfA60clgBBGmg0ZZFsleYLLky3vMj7p33/eKBJhr75WG2KClHIfEqnNDibFaqXAWVxuze5osjNBbKJPh9INJX1XxgF3EWTiGGgWfarns2nAeLIJW/02dL+SL6WQ1Tee2zrZs1Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514616; c=relaxed/simple;
	bh=iF2KoeCWqVMzXm5rpJeYadPjIjcTmJI8IRx8tb9Acls=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IqJdzUdG4bij3Hzkq+Q6JuLyfgcB+K9Zy9SwVCI4SMi4pop/gYDnHUIKEZnvZbn6EcbFBwjM3Tq2WHRtk2AF3QogQ7RYqU4RR0lpqQXMQAchM+E+PpNhbc2ajpWazNNtk+/XuxP8n1Kh9O32MNpLh9u0g9JJ5O4elsBFcFVqbxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=BeFy135g; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="BeFy135g"
ARC-Seal: i=1; a=rsa-sha256; t=1778514599; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kpmLPdUy5AofAMhHqqMmC6GQxs5q2blYD1gILIMkkCOUr01zt/Tj98XSOPLDBccno4i9qGtkIKdfra+dqDID09LAlmvvdMb437vaKBFxypuEzs2Z9OybtcI2AuKbqttOJo1jSqAJfIteqlnOGJtTF5wPxDnj1T0ZqqOyodWAVF8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778514599; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rRbIFuK/sNgACylMJJcZZjhxA42Wn7teJ3JQvmClBeo=; 
	b=Bc/2edVbDmv8+GOwpkx4MUDaAXh36+wHuf86Y8YsSt2OH5GrCjtsZH2b0tthwPhkW38efPjZFIpkHnfXuR3FeUgXDSnNDW2c7KwQhXhJ2wmsAD6Icrt7P0SQ+9fY3hzj8ofxLunFmVOxKylVYk+DDaqRMGrPAVC9vmGEqrjagoQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778514599;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=rRbIFuK/sNgACylMJJcZZjhxA42Wn7teJ3JQvmClBeo=;
	b=BeFy135gEQRfiFrQ83u85rrADZMoyGE0VkeCPOqJWt8IwUBu3ZUAfsm3PLVeYunq
	MBwuVz84a/q1+9a9StWgrj5H3rV1sUW+tBUriZhaHWEY9a1qzGaKZZw1KnTXpFRcJKP
	mIrW7v9sSGH7dyWam1QEc4YkqJYsntYDbyYLpjR3MCUQWrUrFxn6RCcATKFht1RwJ7s
	3FHgRoMJJ2Uq/1LA6jSLztY8XSDzWNzDNLY7J1Xhmvb0gIR4hsjKdANvLDG95zM9HYv
	Y1qAIEDmTcnDYoPtzFgyK9n5947s17BEUNnolBghs4SbzuTQz9iY53T5B5IgJF2CAIE
	3o2T6QDBxw==
Received: by mx.zohomail.com with SMTPS id 1778514597820316.43054960891607;
	Mon, 11 May 2026 08:49:57 -0700 (PDT)
Message-ID: <825a0b7ac8fd5fad8b5f77205244ff2669977375.camel@rong.moe>
Subject: Re: [PATCH v12 14/16] platform/x86: lenovo-wmi-other: Add
 force_load_psy_ext module parameter
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 "Pierre-Loup A . Griffais"	 <pgriffais@valvesoftware.com>,
 =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"	 <nfraprado@collabora.com>,
 marshall@shzj.cc, hyacinth@shzj.cc, 	platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260510042546.436874-15-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
	 <20260510042546.436874-15-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:44:03 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Sun, 2026-05-10 at 04:25 +0000, Derek J. Clark wrote:
> Some Lenovo BIOS have been shown to have incomplete and/or broken
> capability data and WMI attribute IDs. In some cases the capability data
> reports that a feature is not supported when the get/set methods are
> fully implemented. It is also possible that the ACPI methods from the
> ideapad_laptop driver we defer to could be bugged while the WMI method
> is fully working. To aid end users in submitting more complete bug
> reports in these situations, add an override to skip the ACPI and
> compatibility checks to force load the power supply extension as if it
> is fully supported and has no conflicts.
>=20
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v12:
>   - Move the force_load_psy_ext into its own distinct patch.
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 4d95a9109f5e..007fef658bfe 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -185,6 +185,16 @@ MODULE_PARM_DESC(relax_fan_constraint,
>  	"Enabling this may results in HWMON attributes being out-of-sync, "
>  	"and setting a too low RPM stops the fan. Use with caution.");
> =20
> +/* Visibility of power supply extensions */
> +static bool force_load_psy_ext;
> +module_param(force_load_psy_ext, bool, 0444);
> +MODULE_PARM_DESC(force_load_psy_ext,
> +	"This option will skip checking if the ideapad_laptop driver will confl=
ict "
> +	"with adding an extension to set the battery charge behavior and batter=
y charge "
> +	"control end threshold. It will also skip checking if the BIOS reports =
that "
> +	"those features are fully supported. It is recommended to blacklist the=
 ideapad "
> +	"driver before using this option.");
> +
>  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & fa=
n) =3D=3D=3D=3D=3D=3D=3D=3D */
> =20
>  /**
> @@ -898,6 +908,11 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv=
 *priv)
> =20
>  	priv->bh_registered =3D false;
> =20
> +	if (force_load_psy_ext) {
> +		props =3D LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_THRESHOLD;
> +		goto load_psy_ext;
> +	}
> +
>  	/* Deconflict ideapad_laptop driver */
>  	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
>  	if (ret)
> @@ -915,6 +930,7 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv =
*priv)
>  	if (!props)
>  		return;
> =20
> +load_psy_ext:
>  	/* Add battery hooks */
>  	priv->battery_ext =3D lwmi_psy_exts[props];
>  	priv->battery_hook.add_battery =3D lwmi_add_battery;

You said "it should probably also cause is_writable to return true
always when set" in your reply to Ilpo's opinion on v11.

Hmm... I agree with that, but the code here didn't seem to do so. Am I
missing something?

Thanks,
Rong
