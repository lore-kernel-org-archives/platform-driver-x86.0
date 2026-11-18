Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040377;
	b=t0EfISLBLoP5bUdCRoFu+eSnMK6CxFBFVaIRY9KACzmymFL2FWpcdBu178kd2HhnYXR1
	 R5P4ixs4wHdijC84MqPJcB2B/PJRcMZrSpLkUXA3rhWUwQF7rjwzUvvTYW5QCqsdF2Ile
	 JGot+NwcVhPn7kQ0b5Gnxmftwqo13xsQJ9RIhh15KTc6SKfqrkBpAiPTs3P/ETuVdSHA5
	 91xTGspoZidG3TmkYUOV5lzhJXpDRk5TBfJL7WsHu9FmTc2poutDyXdmvkSWhJEs6juSs
	 mzfbmGREO2nHEitMx+KWBXpG5LA3FjJJLP+OPkhuXaTtzmvnUbFfEIuXMOBBP6A0lBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040377;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=l1V9BPWSm5N8xNVPU5xwTS1SjC4z2w/0RQvKp2VJHfc=;
	b=qS9I+5fGRZ5Pp25x2JbU4Nqa6z5iAW4yesk6155pbEEgm/RIuyZXQH7WXYUGDUHGA1yE
	 ovvwfb5dK8tL9Zfv6AEt7aZPBQetFmwbXcv5gzrKvsxsxUtIGAM0IG7QtAlcA7PdcIPb5
	 itRDaaP5W9e9fa8xrdi/NeqRcWKkMn7cKM8Y/pEdcm7ySWPrPCTLNOzsrc9mHLLGExgiD
	 tEaWsCKy4sraUQHtRQTE2XVqyddsbdSzyFymLcfX8Yg9zhHTzIaqf+p5K2X0bwqaOeTLr
	 UZE0qXUV83aCMLsJgNzjssc24jeCmzEKMAzUV1PVFjRYP/ir6lw84mKlz80QyB+kzzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=d3ty9xs+;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=olxaZmCF;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E23606A330
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 22:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E23606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=d3ty9xs+;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=olxaZmCF
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 317A7140018F
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 17:19:36 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 17:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795040374;
	 x=1795126774; bh=l1V9BPWSm5N8xNVPU5xwTS1SjC4z2w/0RQvKp2VJHfc=; b=
	d3ty9xs+QxoERbrI2rqinOzGhSkHlYIW1bd24X89MTgozhsstPaA9xuBnT56NCN+
	HGi5C251s/YmWCTBvFFg0FiCtwrDoCoPFuNC4bWihiGmajpOM5h2w26aVFoeFPr3
	JnwQkvmpzTTusVHqsZhCJaLuW1bDNlAz0QwHRYt4g7uVqTrg3tGysfSFFWsFArL9
	x4qXbLX/aSYk7lZdMyOiSAXe1mMHuvQyl60FaOfeZnk0kxtd8aADtUxPUpZbtAfL
	kuHhNToj6WdHjQ0r4X/TUuZE7GWPdLBSMIg0NEROR1Bok/POqXcOCSZQIoI6tIt8
	wUyBaUYXmGVQ0gNE5dvW6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795040374; x=
	1795126774; bh=l1V9BPWSm5N8xNVPU5xwTS1SjC4z2w/0RQvKp2VJHfc=; b=o
	lxaZmCFYyhB+Ia6+mp5PexAjBdX9vuOIHtFKvfqzMGod9K3BpCFC2x0NopO2JdxF
	LjpNE7WmSDKOfQ6/Ka7QCGySMGoHNKyQl18pkCHDPiHQwArE7C2hBcrDyPPQ1WPm
	4VgkR1m4Gh5dnwFUonLiRpD1JDd7SXPgXsAvdwoZFh41ZR3xaVN/0qizgYQRuoCM
	9V03m3/9o+XI8Nj3BtJ2vUOckikcWREpfiH7LuBA6myFTQX1A5jJrSaknkg7EqAJ
	cXVb+cLuEzn1tG7xLOpV0jZqXiFmTOW1yQ9Vse7OjbzI/gLFogV8nigCh2X/idjW
	YsRLFoITzgB68jCZHUx8w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795040374; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:bOw8+Sh49riRPqaEElMvFUCkDw/JfxjDIyBHfZNcnqca+YM
	3pNLpr7RvEjDQ7ohvgAMiuZ0rvcJ4f6vOtl64QxgUtP+5Xk250xWYUypK2hECmSN
	5aFtVATZyNwf5l/w4j+uVisNmZIHnf4J9x9O5aofwQFSjC6MolVGP2Jcy070X7nZ
	JiOH425/vo952/hCyQoEYvEavZkCm1seQA5iAC1u1gvsrbKuJkW+KiliuFaVbo0y
	dsYJTHZestxn8QNlXb8Civ1lhZKa/+esdCBeEkzp0JZjFqxH1bLMS7U1Q3PuKx3a
	Vnmx7HNDDUXxb11p6qKoLykIIYl1dpAz2PcK9qA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VRdavDhhLSbC5Nn3z+TcjSRKpqiOjV4pFCztFzCj30A=:UMnXTxM7OGbAThcMaVpk2msBlIVtqL/kCQLisheXO1M=;
X-ME-Sender: <xms:diT-ao_EFZwcJUvnlaO2TlINDIspsPcs5crp6OEC5-wOzpMsRqM99A>
    <xme:diT-arj-PxX7BdT0zBQqaa5hrR4JrlPZJb3eT_bHwWatpMzHnxJMh5h9dnJ5K1-Ug
    wC-SHhm_O9TKFh5ChhizVzUrSX0ea2z-YZzKNLkjbl3cEbeWW_97nq6>
X-ME-Proxy-Cause: dmFkZTGorBEE4WfyVq2CBYAiUC83eki8kQxMu2n25ug9D0wzPQNpFkC9MQteRwd4mZT7lH
    qLwoOxpiCVQzUq1oupXoBExKGdHuL5/pEObLPLCJisRGYTH9/t5bigXyYebzL26lCl9XPG
    1mp0xOK3y+CDYr3oMGQ825EXjaVkW/VRfAdgdaWmuOSH8nrHjr54WbBHJCMerJADY1uOja
    GeeRqAfAoHSHEcfrEAQmZho34gHsT23uIsu2zwxo7j3AW90tOE5A+gU+T8kPt19JOvoMwi
    N8En3Laa6edu7JK76c8Uea3mS4xCJ+rT+a+E32ZRg+YsFT/0BknJJ4+R3q2e8+OTmgliJF
    MHqth/aUI4ajQvo2Ow4TvvjayUFmPRr+/Q5VeoEypNf3WCX+d8SC16VNolMVl0ICaZBZlK
    ijRxVKZBsQDYaYDvjdj1+mm+u90/xaWTMA29eT930b2HoDfFnfsdGtD+vdsyjLhDsB5UwJ
    qsBSMyr/SbZpedNGgyBSj/nPCwJjNoRTgy2c10Mz4JO1S9LmQcYBJA3H6JeMirhfjvr07R
    76Wju8hgyYpdcTEeuvajhzYrISAz7cC5nBjSQQvs/XjEfWy+tFbLytcZfjIr3TSJK2J3f7
    b0jmrExtl1ncJ6H/se51ihrAfJdS+c5s2i/pW0IX1bZXOQQvGehs4AoG5ABA
X-ME-Proxy: <xmx:diT-als9mgT4EWh-rrbVOzZE1A_rbAf_ia3-T8DPD1qA7D-rdJSShQ>
    <xmx:diT-ahDCYzUY0KE3O99xNVzRgD5BP9-SaZQmsSNpAODDEratfMtaSA>
    <xmx:diT-asbVsakBfIujTvc4_4XaEu8Dw2hDK9OnLYCkLgT09Cu6p3JoLg>
    <xmx:diT-asWe3NpGWanDKgFScFxdcZxwOqLOv4t5lUWmHHKuF2fRHoT7nw>
    <xmx:diT-anjOFErh-qKPT3lX-3YEyjnJaDorEubgnCs28vlz0Qtb7twwHNxH>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id AD2B62C0008E; Wed, 18 Nov 2026 17:19:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AyL-WdoO_gUZ
Date: Wed, 18 Nov 2026 17:19:14 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Alok Tiwari" <alok.a.tiwari@oracle.com>, "Armin Wolf" <W_Armin@gmx.de>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <57a8122f-f0c7-4844-ab21-be2c81272c3e@app.fastmail.com>
In-Reply-To: <20261119-lwmi-no-singleton-v1-1-6b06fcfb5126@rong.moe>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
 <20261119-lwmi-no-singleton-v1-1-6b06fcfb5126@rong.moe>
Subject: Re: [PATCH 1/5] platform/x86: lenovo-wmi-other: Retrieve private data from
 firmware_attributes device
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 18, 2026, at 1:58 PM, Rong Zhang wrote:
> Currently, each tunable_attr_01 stores a pointer to the WMI device,
> which is unnecessary, as attributes' show/store callbacks can always
> access the firmware_attributes device through the kobject hierarchy.
> This also makes the driver fail to satisfy the requirements of a
> no_singleton driver.
>
> Store a pointer to the driver's privated data in the firmware_attributes
> device's drvdata, and retrieve it in attributes' show/store callbacks,
> so that we can get rid of tunable_attr_01.device and make it possible
> for upcoming refactoring to eliminate all wrapper callbacks created by
> macros and constify all statically allocated variables relevant to our
> firmware_attributes interface.
>
> Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
> b/drivers/platform/x86/lenovo/wmi-other.c
> index bd64e7b44669..c31a8bd08a85 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -967,7 +967,6 @@ static void lwmi_om_psy_remove(struct lwmi_om_priv 
> *priv)
>  /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== 
> */
> 
>  struct tunable_attr_01 {
> -	struct device *dev;
>  	u8 feature_id;
>  	u8 device_id;
>  	u8 type_id;
> @@ -1124,6 +1123,11 @@ struct capdata01_attr_group {
>  	struct tunable_attr_01 *tunable_attr;
>  };
> 
> +static inline struct lwmi_om_priv *kobj_to_om_priv(const struct kobject *kobj)
> +{
> +	return dev_get_drvdata(kobj_to_dev(kobj->parent));
> +}
> +
>  /* Attribute Methods */
> 
>  /**
> @@ -1163,7 +1167,7 @@ static ssize_t attr_capdata01_show(struct kobject 
> *kobj,
>  				   struct tunable_attr_01 *tunable_attr,
>  				   enum attribute_property prop)
>  {
> -	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
> +	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
>  	struct capdata01 capdata;
>  	u32 attribute_id;
>  	int value, ret;
> @@ -1219,7 +1223,7 @@ static ssize_t attr_current_value_store(struct 
> kobject *kobj,
>  					const char *buf, size_t count,
>  					struct tunable_attr_01 *tunable_attr)
>  {
> -	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
> +	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
>  	struct wmi_method_args_32 args = {};
>  	struct capdata01 capdata;
>  	enum thermal_mode mode;
> @@ -1277,7 +1281,7 @@ static ssize_t attr_current_value_show(struct 
> kobject *kobj,
>  				       struct kobj_attribute *kattr, char *buf,
>  				       struct tunable_attr_01 *tunable_attr)
>  {
> -	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
> +	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
>  	struct wmi_method_args_32 args = {};
>  	enum thermal_mode mode;
>  	int retval;
> @@ -1304,6 +1308,7 @@ static ssize_t attr_current_value_show(struct 
> kobject *kobj,
> 
>  /**
>   * lwmi_attr_01_is_supported() - Determine if the given attribute is 
> supported.
> + * @priv: Driver private data
>   * @tunable_attr: The attribute to verify.
>   *
>   * For an attribute to be supported it must have a functional get/set 
> method,
> @@ -1324,10 +1329,10 @@ static ssize_t attr_current_value_show(struct 
> kobject *kobj,
>   *
>   * Return: true if capdata and set/get modes are found, otherwise 
> false.
>   */
> -static bool lwmi_attr_01_is_supported(struct tunable_attr_01 
> *tunable_attr)
> +static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
> +				      struct tunable_attr_01 *tunable_attr)
>  {
>  	u8 modes[2] = { LWMI_GZ_THERMAL_MODE_CUSTOM, 
> LWMI_GZ_THERMAL_MODE_NONE };
> -	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
>  	struct wmi_method_args_32 args = {};
>  	bool cd_mode_found = false;
>  	bool cv_mode_found = false;
> @@ -1350,8 +1355,7 @@ static bool lwmi_attr_01_is_supported(struct 
> tunable_attr_01 *tunable_attr)
>  	if (!cd_mode_found)
>  		return cd_mode_found;
> 
> -	dev_dbg(tunable_attr->dev,
> -		"cd_mode_id: %#010x\n", args.arg0);
> +	dev_dbg(&priv->wdev->dev, "cd_mode_id: %#010x\n", args.arg0);
> 
>  	/* Determine tunable_attr->cv_mode_id, returns 1 if supported */
>  	for (i = 0; i < ARRAY_SIZE(modes); i++) {
> @@ -1371,7 +1375,7 @@ static bool lwmi_attr_01_is_supported(struct 
> tunable_attr_01 *tunable_attr)
>  	if (!cv_mode_found)
>  		return cv_mode_found;
> 
> -	dev_dbg(tunable_attr->dev, "cv_mode_id: %#010x, attribute support 
> level: %#010x\n",
> +	dev_dbg(&priv->wdev->dev, "cv_mode_id: %#010x, attribute support 
> level: %#010x\n",
>  		args.arg0, capdata.supported);
> 
>  	return capdata.supported > 0;
> @@ -1558,9 +1562,10 @@ static void lwmi_om_fw_attr_add(struct 
> lwmi_om_priv *priv)
>  		goto err_destroy_classdev;
>  	}
> 
> +	dev_set_drvdata(priv->fw_attr_dev, priv);
> +
>  	for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> -		cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
> -		if (!lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr))
> +		if (!lwmi_attr_01_is_supported(priv, cd01_attr_groups[i].tunable_attr))
>  			continue;
> 
>  		err = sysfs_create_group(&priv->fw_attr_kset->kobj,
>
> -- 
> 2.55.0

Looks good to me
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
