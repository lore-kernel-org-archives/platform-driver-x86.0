Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A4E3546E4
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558953; cv=none; b=FcwCEgXIB4Chj1Ohv6ssiQSfZtEC/Z3cZhJgP68Kqmfp0kXfFZAtE0vMCDhbdOf7xZm8BRL6yoobmiCDQnnx4FZyG6ZcohRJ0oF/dQb2wVpq6kL9mM7ENxjOlHwP0BZ9g9y86JYNttxzmWf3nM+AlJ3MUGu3BGT2rhz6rlz/I5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558953; c=relaxed/simple;
	bh=r/WHkbVyybyZQ1LlyN5FyLuD1RrUb1aDMYV1OPx3h0Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=nZO9fDSa+yZBeooM6xepiefBfrmcMSX4+bAd63w8oNSGSPUHbfkJ1RLewGwO1Jetc69aEpnq20BVgPmZPHCUbeLBxWCji4sP2OLaPBOoEy5nHO93RT4iuT8kCVpaZaB8cNb/Xuy86PR4cpk7eQr4uzWEgusq7FmheCshOOeRKIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsOaLSQh; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsOaLSQh"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-49429181ce9so2289053fac.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Oct 2026 08:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791558950; x=1792163750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cd/NKQgH/SPcEVf62kJ3YHPeBmhuQBl0/uewYv3guOw=;
        b=WsOaLSQhFrwp0YPNpdanGuzm77Lu6TlstY/x61/RibDkGJJRrkdZ8VsdvxbvFSYzWe
         bNEWYoSaEEOdUdY8PFKwoYUZAxTzI0YZ75ffMV4Wju200XaE7He/YFqnOzbC8AbOGaHQ
         jpqgqZOM26cx2UrSw3mlnoW5qod3wTQoh5hHdFMyepU2CiaBXdcJyOesKa07fGHylK+3
         RGHq6AyRyn/NWdK/fCBTN85HJ8n50CL0yDvNgeo4pidhfskKekMcxH55fijJVLr4D0q6
         dnN1MxsSRgXNOenfjxWIrUG8a6/6JS5d/VWE3Wzho3uZgM9cB6T/Wzkkt+kqaaHlwgjF
         zr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558950; x=1792163750;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd/NKQgH/SPcEVf62kJ3YHPeBmhuQBl0/uewYv3guOw=;
        b=tCafHuMdcoTFay2wh52y9pwmJjIVZYdWzQU/aXA9BIaK6TKVEmqQrwQMJO4xQNh4eX
         wobYPh5g0c75yT2gX03TAInwL+Dg0aMOqC6prk1p8/sSgBU0fvyMw/Gl6nDL4GFwnXZG
         xesQ8nmfO/VgnbY1zMiVq8sXz9TxUeOdi+DPckgcKZRfRuq5Xv2AKLuToz0VhoPNFGha
         B3eFh+XlZx60Kb2Jx4WeluZ0zYH4ORA91e5LCyluUL443T0NxjaF63l860CNhP237Gh3
         W60hW0NYcoAttupDjHLION3ido1jnysObf35TG22NgCn2SsfpiisVfRi65hBunklkwme
         u8dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxW8sbmO7U0Q1w0F+136zREfmb4PGsvvHDyT2pIUTwFaxf2e1hHGev1VpnHCRHaiv0a1i6MPelkCeJNyw/99gGnOkWb@vger.kernel.org
X-Gm-Message-State: AFq9FYJ92mGLRdRIPF6vA8DzeGKQ3z+27uuAHp95DqHuNfv7LkNaEkfK
	sZfpYEvt1XIhXgK9r7UHyq/O5Iv4s6GOg9lwM4HGszKzvthukRI2sbpJ
X-Gm-Gg: AYBFou3KAuVtrwlrGqTHOgYfYJllj2Fjn1G0MvMN1OpsSShjGUZFwsn5AnngsQiVvnG
	IXwJ3uTVJg18ZRuyZ1ZcGDNcxTeUhSvdor6oGMt6aYxbnD5v4LKJJXJruo37Wmh0hD0kGbba+m7
	8fJ23pA5Bd6+04Orpv9lfHAEOMZdq0sFAMa3218m6eXfkeLAF9AsfEl8tVgrbd6y53aAsC4/cNz
	1MYvAjdAagkEj1uCgRKs6dAq2/dU3ryvbbycRIs8353SYxFPq86d7/LjPH3UCYzCh4yOPoBUcXn
	p4zX8E80jb2Kv88lWcu+b67pcg0h5I4m9F3SYfOJ4jgBhNBW4t71efTxn8fKrLHP2v8UA07jNtl
	Zddg/qkUNpIfkVh86zFcnOYmg4N58FB0lnkHhyl2i53q64RzsJTKXWhWRW8jEIFz1AUGTbmcSvs
	knt5Yx6JnudcoTebx4gRrnm5XM6XUxi30Th9OoZmaJtRRKAl+G8nfkhws/47EwRxC8iHU2PrPT7
	ao7QyKQ6rky6+b/GHPbYZMqWTc6fh+CPQxMRvePg4rkKAfvJ//KelE6FE7K6VWh/dga4VCwVoCO
	mTQ=
X-Received: by 2002:a05:6870:f213:b0:48f:e107:8e48 with SMTP id 586e51a60fabf-4a2a8911601mr1832630fac.41.1791558950273;
        Fri, 09 Oct 2026 08:15:50 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a86317a5sm1904867fac.17.2026.10.09.08.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 08:15:49 -0700 (PDT)
Date: Fri, 09 Oct 2026 08:15:46 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>
CC: Charles <hanker007@gmail.com>, Navon John Lukose <navonjohnlukose@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_03/12=5D_platform/x86=3A_lenovo-wmi-cap?=
 =?US-ASCII?Q?data=3A_Only_allocate_sub-master_info_when_necessary?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-3-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe> <20261009-lwmi-wmi-new-api-v2-3-402828382679@rong.moe>
Message-ID: <807F11B7-33B6-454F-B550-F516E974703B@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 9, 2026 5:53:45 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>When capdata00 declares no fan test support, there is no need to
>allocate sub-master info as it's basically unused except for the
>priv->sub_master->sub_component_list =3D=3D ERR_PTR(-ENODEV) placeholder=
=2E
>
>Therefore, only allocate priv->sub_master when necessary, otherwise its
>absence implies the absence of sub-component=2E With that,
>PTR_ERR(sub_component_list) =3D=3D -ENODEV is repurposed for the followin=
g
>changes to represent stubbed sub-component=2E
>
>Signed-off-by: Rong Zhang <i@rong=2Emoe>
>---
> drivers/platform/x86/lenovo/wmi-capdata=2Ec | 36 ++++++++++++++++++-----=
--------
> 1 file changed, 21 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-capdata=2Ec
>index 58787da959b4=2E=2E3a823aee608a 100644
>--- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>+++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>@@ -101,9 +101,11 @@ struct lwmi_cd_priv {
> 	struct lwmi_cd_sub_master_priv {
> 		struct device *master_dev;
> 		cd_list_cb_t master_cb;
>-		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies no sub=
-component=2E */
>+		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies stubbe=
d
>+						     * sub-component=2E
>+						     */

Hi Rong,

Hitting the column limit here looks ugly and harms readability IMO=2E Perh=
aps we could rename the variable (sc_list?) or be less explicit about the f=
ull error signature?
- Derek

> 		bool registered;                    /* Has the sub-master been registe=
red? */
>-	} *sub_master;
>+	} *sub_master;                              /* NULL impLnlies no sub-co=
mponent=2E */
> };
>=20
> struct cd_list {
>@@ -258,6 +260,12 @@ static int lwmi_cd_component_bind(struct device *cd_=
dev,
> 	case LENOVO_CAPABILITY_DATA_00:
> 		binder->cd00_list =3D priv->list;
>=20
>+		/* Missing sub-master info implies missing sub-component=2E */
>+		if (!priv->sub_master) {
>+			binder->cd_fan_list_cb(om_dev, NULL);
>+			break;
>+		}
>+
> 		priv->sub_master->master_dev =3D om_dev;
> 		priv->sub_master->master_cb =3D binder->cd_fan_list_cb;
> 		lwmi_cd_call_master_cb(priv);
>@@ -288,13 +296,9 @@ static void lwmi_cd_component_unbind(struct device *=
cd_dev,
> {
> 	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
>=20
>-	switch (priv->list->type) {
>-	case LENOVO_CAPABILITY_DATA_00:
>+	if (priv->sub_master) {
> 		priv->sub_master->master_dev =3D NULL;
> 		priv->sub_master->master_cb =3D NULL;
>-		return;
>-	default:
>-		return;
> 	}
> }
>=20
>@@ -369,17 +373,19 @@ static int lwmi_cd_sub_master_add(struct lwmi_cd_pr=
iv *priv,
> 	struct component_match *master_match =3D NULL;
> 	int ret;
>=20
>+	/*
>+	 * If the sub-master has no sub-component, there is no need to allocate
>+	 * or register the sub-master=2E The master callback will be called wit=
h
>+	 * NULL on master <-> sub-master bind to inform the master about the
>+	 * absence of sub-component=2E
>+	 */
>+	if (sub_component_type =3D=3D CD_TYPE_NONE)
>+		return 0;
>+
> 	priv->sub_master =3D devm_kzalloc(&priv->wdev->dev, sizeof(*priv->sub_m=
aster), GFP_KERNEL);
> 	if (!priv->sub_master)
> 		return -ENOMEM;
>=20
>-	if (sub_component_type =3D=3D CD_TYPE_NONE) {
>-		/* The master callback will be called with NULL on bind=2E */
>-		priv->sub_master->sub_component_list =3D ERR_PTR(-ENODEV);
>-		priv->sub_master->registered =3D false;
>-		return 0;
>-	}
>-
> 	/*
> 	 * lwmi_cd_match() needs a pointer to enum lwmi_cd_type, but on-stack
> 	 * data cannot be used here=2E Steal one from lwmi_cd_table=2E
>@@ -404,7 +410,7 @@ static int lwmi_cd_sub_master_add(struct lwmi_cd_priv=
 *priv,
>  */
> static void lwmi_cd_sub_master_del(struct lwmi_cd_priv *priv)
> {
>-	if (!priv->sub_master->registered)
>+	if (!priv->sub_master || !priv->sub_master->registered)
> 		return;
>=20
> 	component_master_del(&priv->wdev->dev, &lwmi_cd_sub_master_ops);
>

