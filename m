Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040406;
	b=sRQzAJC+AuGQOtK/SCK4epm2R/hPMdWUhs4b6NlVtUxs5Hw49EdEwT+ReupLIngkAv4W
	 pLob5nvVgWw5lXjnwIJiTek+/YD8J/Fltqm0UESpRED0zXRrEdeYicsTC5fEq5xfOXsx6
	 yJXj4+EX/0SF6fBk6RVQkW+Dja2RAN8yMDC0uO2YgknrYNoJVQ6w+QDGGCI46ZG9v0S04
	 2Bx3WE4CnFDcBnoYt1nmMeUwjTulU7C22daQ9S30jdvjWxrj9xMEue5UqCrVqDwnAl9Wr
	 0ZXqijx4frUrUydREeYV1EWvZtS3bW9/b5aOEiBO47tDrt+Y+u8KGVLWT1RYasj65kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040406;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=7KNBieCwl5sfYbIk+Jomg7UKzL9YbjjiplZfciCEJAM=;
	b=WJ4SH2KuT4Uav1iYs09tdgzMXWrFNDkgfyqU+mYdDjdppp0fcMQMGaciXWiGA6JUKSkA
	 DG6MezVYr/V0yDKz0KY20iltMcR9giwCHUENBiw0px/0d+PWoCEhMFlR6zu90YjVhnx1F
	 4If/egE9MhkfsUM7SDtoW6xTJa6CCSDwKKMLlCX7e0pAv1nU41B9U4MBqHGjseJS6d6Mm
	 e4yHFjVY/3TYxL56Cr3t7HkRxNM0X9Q7qfnaOYx5UavSZ6cSKw/l4/X8SAybO++wc41pj
	 MOB+nXJDzB6PCNEVsbcH3CwyEMhNw467wyjbinXB3bhZj2iQncZiO94WWL82UCZ1wgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=XgYjIUJ8;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FllMtLow;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0141606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 22:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0141606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=XgYjIUJ8;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FllMtLow
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id DDFB6EC0633
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 17:20:04 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 17:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795040403;
	 x=1795126803; bh=7KNBieCwl5sfYbIk+Jomg7UKzL9YbjjiplZfciCEJAM=; b=
	XgYjIUJ8RNIw/tzI9VwSY0fYve/Hh6LAdgOuaaN69FaBZV2GQTA0twpnhfaWyYwk
	v9gpNKR3I4Q/Dw5AdwLcg+sd72hKMk45F3lPrm1HZyuSLy6Yun24r3ULsLZoikKh
	hFHP0pgKo/ayf5nuu6f4v2Jtr+JkNXw9k5p3LPOOS25UXca7Q8G3FcwLzm1Dha4h
	GxcDtdkeuFgTKK5wxiNWSad/0dhyvsuMW1drEleeG1H+4HhY+Qq4sI/LBcVj1Bnd
	MUGRz7jaf0cblQsoNAzEzN7hwhYaDm1uSuS4weC+Sz/LUYbypkdXS8H5BX1fSePj
	MmUlDlDPeCOt9i1SOXoTog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795040403; x=
	1795126803; bh=7KNBieCwl5sfYbIk+Jomg7UKzL9YbjjiplZfciCEJAM=; b=F
	llMtLow1H0kTMfGakr3YLDFQ0cz1orldM/A/HtjIteJflIXr/ebl0zLmXe06P2zu
	Ctc9Auakh6mxbRrmPu0SmeB9AbEjXZqBHgDfxlYNtR53rPDZA7diueXs4Dk375Rk
	iW4SVItVvywM180vaZ3r1CgOuVdW371xoAtuDhaQnU3GVdNcRWl2IdIgVbu9/msG
	oVeUzYyBZLmDElI2SpUz/jnput5o9g4xOVH8+a8RSFLTuvysBbiqp6jaBCjKH/P1
	vR2stXGKMW/POOmBHaxr2L/hfrho5vDJinJuHpFWA2aG3wvlz0nCflEMUL7vYbCk
	CLQHraW3ynw5udTbFZagQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795040403; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:RzdOdcEYx5JwsQ9GQj8FC/JPTmIqOBtpHfda+9kWdocma9p
	cWOVP1AT99iK7+AsgnQYi+ynDynKSnG8DzFHB+/N7oqMJ3OX+8G5UvlLSpjhs0Fv
	6DKOshTPZeL5yJy1Unss0oAjlSImUw4Eh0avYyzvg5E5Vm1W40pEUCi4xBipF7gg
	3kJsYYBX0/791P9mY6gqWXY3gw/uzPJa8l12Z6fnODrwxzGE7asMjraccl2e+QzO
	fKuotCAXyhzOdeb5zMLXz3INgpHP1GWOAC2j8wKKqdDU+Ojvvq9ja92Z/nYtSxM6
	ewp/dT9D7NcIccbs4HPrRnp9g8zphYr4bW9Envg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tYr/aWXAogHJFI7XHZxyQT0dr9qWbgxXf1unaFp58Ms=:KK3Iht5pdOL6eECQcrvytrSjwdnBpIPObtTG5kmcSIs=;
X-ME-Sender: <xms:kyT-agRaNm8z9npxkj5FhbQE5v6mMpvGu9fmCq2-6W1EnUbP3zhXOg>
    <xme:kyT-aom_Qn7x5d8FSZ98moaayyoEjL_bIXQQ_4dgYZ5R1Y94ns56bGCPfsGq4QKeN
    lJzJ6e1ryGZH43ocmJlNCMsu8MSQkPfZ6UHdILlnNxl6B6vAv4GnjrL>
X-ME-Proxy-Cause: dmFkZTFPvEAGP2ZO3YrRY5Gmsq1YOSp07g41kQmIBJS2DiYuCZT/nDBeB9y8g/j4NbZw7v
    vhpJcI5d/35aDe9EeXSYdEbKz0BTvKdj57IGRjkG/rfC5FdQII7vdx67mstnOKc/8kuCnd
    VIWlzRO2WiADZdk5xhWOIBJT69xaiejtSYWTolsvFrnWrjSazl9J1JvoQM+gZsaXxYxXVs
    ME0ktk70wKUGp2uuHsbS44yaqFSIQOxcfAnnLpC4S1XS/tX6C5Uu+NCUx5TXhVbDas5vrC
    i6MvJMM2BR7yZR0DsISSpyDwbqnnp1Mkx0OO94Sb1H3HivTpquZFKWBUYz0fL7nr+s9UMR
    u1sg/dG/BMULfpa0CLnwIBaW+0wxJJjwBkDqVA8GwNdR6jrnHj0q0LiG6rzgDm9UacM0zA
    yrWqOR1z//C9WHSGprxDh9/1tDOevsXVxY5wESH1xTVnWhLiTuHJ1pP/jnryUOMwtubFcU
    g5yIRmpojPILJjwjjH8oCUSLNyC0K+V0pO5s0mxgSTZfoay5WTpy3i4cJr7bcNfxciWGgt
    xmGfKmEot4naiM8ZzsY+erSbkzHmPbFl3ljNPq4sEETqzH2x3PqmBJbw9G4K9bj7R2/6gL
    9+mFzvp5vw1vvlht+zKG26L6nEGDDc+kqcxkoCAoFW+akosMjrvkAWZ23iXQ
X-ME-Proxy: <xmx:kyT-ajDq5jEEgng0YKqXQZ4xFFOJRqLutLtw2XrxrQruG-7uQ6ujwg>
    <xmx:kyT-asG2rGx51HFa4P_MhgwAdT9_meRY6VEaj4Urf4VUnwJzkon8mA>
    <xmx:kyT-aiMLxdBF_dPO-WoGWUYXAlc-3sunrLzCW8sRKBg6sNhEFD-ocw>
    <xmx:kyT-al7lt5ejfc_aXxWZ6DiCOJME710ifNJividH_IY1_4uJfwcvNw>
    <xmx:kyT-aub42Om8kr33ZW2ZT0CuE9JuKYZte6_HHd18unn_jm_7g2AJItI1>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 5AA532C0008E; Wed, 18 Nov 2026 17:20:03 -0500 (EST)
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
X-ThreadId: AOpiVLqPvChg
Date: Wed, 18 Nov 2026 17:19:42 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Alok Tiwari" <alok.a.tiwari@oracle.com>, "Armin Wolf" <W_Armin@gmx.de>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <2a87d4a1-b494-455f-984a-e8b93d5df70a@app.fastmail.com>
In-Reply-To: <20261119-lwmi-no-singleton-v1-3-6b06fcfb5126@rong.moe>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
 <20261119-lwmi-no-singleton-v1-3-6b06fcfb5126@rong.moe>
Subject: Re: [PATCH 3/5] platform/x86: lenovo-wmi-other: Factor out tunable_attr_01
 definition into a macro
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Nov 18, 2026, at 1:58 PM, Rong Zhang wrote:
> Currently, all definitions of statically allocated tunable_attr_01
> variables are open-coded, making them hard to refactor.
>
> Add a macro to define statically allocated tunable_attr_01 variables so
> that further refactoring only touches the macro itself.
>
> Meanwhile, move the definition of statically allocated tunable_attr_01
> variables before the definition of struct lwmi_om_priv, so that upcoming
> changes can reference the former as needed.
>
> No functional change intended.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 178 +++++++-------------------------
>  1 file changed, 38 insertions(+), 140 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
> b/drivers/platform/x86/lenovo/wmi-other.c
> index 4d51b05a5acf..252ef775f300 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -130,6 +130,44 @@ struct lwmi_fan_info {
>  	long max_rpm;
>  };
> 
> +struct tunable_attr_01 {
> +	u8 feature_id;
> +	u8 device_id;
> +	u8 type_id;

Really just a minor note that everywhere else in the code goes device, feature, type.
If you end up doing a v2 can you swap the order of feature and device in the above - purely for universal karma?

> +	u8 cd_mode_id; /* mode arg for searching capdata */
> +	u8 cv_mode_id; /* mode arg for set/get current_value */
> +};
> +
> +#define DEFINE_TUNABLE_ATTR_01(_name, _device, _feature, _type)	\
> +	static struct tunable_attr_01 _name = {			\
> +		.device_id = LWMI_DEVICE_ID_##_device,		\
> +		.feature_id = LWMI_FEATURE_ID_##_feature,	\
> +		.type_id = LWMI_TYPE_ID_##_type,		\
> +	}
> +
> +DEFINE_TUNABLE_ATTR_01(ppt_pl1_spl, CPU, CPU_SPL, NONE);
> +DEFINE_TUNABLE_ATTR_01(ppt_pl1_spl_cl, CPU, CPU_SPL, CROSSLOAD);
> +DEFINE_TUNABLE_ATTR_01(ppt_pl2_sppt, CPU, CPU_SPPT, NONE);
> +DEFINE_TUNABLE_ATTR_01(ppt_pl2_sppt_cl, CPU, CPU_SPPT, CROSSLOAD);
> +DEFINE_TUNABLE_ATTR_01(ppt_pl3_fppt, CPU, CPU_FPPT, NONE);
> +DEFINE_TUNABLE_ATTR_01(ppt_pl3_fppt_cl, CPU, CPU_FPPT, CROSSLOAD);
> +DEFINE_TUNABLE_ATTR_01(cpu_temp, CPU, CPU_TEMP, NONE);
> +DEFINE_TUNABLE_ATTR_01(ppt_pl1_apu_spl, CPU, CPU_APU, NONE);
> +DEFINE_TUNABLE_ATTR_01(ppt_cpu_cl, CPU, CPU_CL, NONE);
> +DEFINE_TUNABLE_ATTR_01(ppt_pl1_tau, CPU, CPU_TAU, NONE);
> +DEFINE_TUNABLE_ATTR_01(ppt_pl4_ipl, CPU, CPU_IPL, NONE);
> +DEFINE_TUNABLE_ATTR_01(ppt_pl4_ipl_cl, CPU, CPU_IPL, CROSSLOAD);
> +DEFINE_TUNABLE_ATTR_01(gpu_nv_ppab, GPU, GPU_NV_PPAB, NONE);
> +DEFINE_TUNABLE_ATTR_01(gpu_nv_ctgp, GPU, GPU_NV_CTGP, NONE);
> +DEFINE_TUNABLE_ATTR_01(gpu_temp, GPU, GPU_TEMP, NONE);
> +DEFINE_TUNABLE_ATTR_01(gpu_nv_ac_offset, GPU, GPU_AC_OFFSET, NONE);
> +DEFINE_TUNABLE_ATTR_01(dgpu_boost_clk, GPU, DGPU_BOOST_CLK, NONE);
> +DEFINE_TUNABLE_ATTR_01(dgpu_enable, GPU, DGPU_EN, NONE);
> +DEFINE_TUNABLE_ATTR_01(gpu_mode, GPU, GPU_MODE, NONE);
> +DEFINE_TUNABLE_ATTR_01(dgpu_didvid, GPU, DGPU_DIDVID, NONE);
> +DEFINE_TUNABLE_ATTR_01(gpu_nv_bpl, GPU, GPU_NV_BPL, NONE);
> +DEFINE_TUNABLE_ATTR_01(gpu_nv_cpu_boost, GPU, GPU_NV_CPU_BOOST, NONE);
> +
>  struct lwmi_om_priv {
>  	struct component_master_ops *ops;
> 
> @@ -966,14 +1004,6 @@ static void lwmi_om_psy_remove(struct lwmi_om_priv *priv)
> 
>  /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
> 
> -struct tunable_attr_01 {
> -	u8 feature_id;
> -	u8 device_id;
> -	u8 type_id;
> -	u8 cd_mode_id; /* mode arg for searching capdata */
> -	u8 cv_mode_id; /* mode arg for set/get current_value */
> -};
> -
>  /**
>   * tunable_attr_01_id() - Formats a tunable_attr_01 to a capdata 
> attribute ID
>   * @attr: The tunable_attr_01 to format.
> @@ -986,138 +1016,6 @@ static u32 tunable_attr_01_id(const struct 
> tunable_attr_01 *attr, u8 mode)
>  	return lwmi_attr_id(attr->device_id, attr->feature_id, mode, 
> attr->type_id);
>  }
> 
> -static struct tunable_attr_01 ppt_pl1_spl = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_SPL,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 ppt_pl1_spl_cl = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_SPL,
> -	.type_id = LWMI_TYPE_ID_CROSSLOAD,
> -};
> -
> -static struct tunable_attr_01 ppt_pl2_sppt = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_SPPT,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 ppt_pl2_sppt_cl = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_SPPT,
> -	.type_id = LWMI_TYPE_ID_CROSSLOAD,
> -};
> -
> -static struct tunable_attr_01 ppt_pl3_fppt = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_FPPT,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 ppt_pl3_fppt_cl = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_FPPT,
> -	.type_id = LWMI_TYPE_ID_CROSSLOAD,
> -};
> -
> -static struct tunable_attr_01 cpu_temp = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_TEMP,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 ppt_pl1_apu_spl = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_APU,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 ppt_cpu_cl = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_CL,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 ppt_pl1_tau = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_TAU,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 ppt_pl4_ipl = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_IPL,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 ppt_pl4_ipl_cl = {
> -	.device_id = LWMI_DEVICE_ID_CPU,
> -	.feature_id = LWMI_FEATURE_ID_CPU_IPL,
> -	.type_id = LWMI_TYPE_ID_CROSSLOAD,
> -};
> -
> -static struct tunable_attr_01 gpu_nv_ppab = {
> -	.device_id = LWMI_DEVICE_ID_GPU,
> -	.feature_id = LWMI_FEATURE_ID_GPU_NV_PPAB,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 gpu_nv_ctgp = {
> -	.device_id = LWMI_DEVICE_ID_GPU,
> -	.feature_id = LWMI_FEATURE_ID_GPU_NV_CTGP,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 gpu_temp = {
> -	.device_id = LWMI_DEVICE_ID_GPU,
> -	.feature_id = LWMI_FEATURE_ID_GPU_TEMP,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 gpu_nv_ac_offset = {
> -	.device_id = LWMI_DEVICE_ID_GPU,
> -	.feature_id = LWMI_FEATURE_ID_GPU_AC_OFFSET,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 dgpu_boost_clk = {
> -	.device_id = LWMI_DEVICE_ID_GPU,
> -	.feature_id = LWMI_FEATURE_ID_DGPU_BOOST_CLK,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 dgpu_enable = {
> -	.device_id = LWMI_DEVICE_ID_GPU,
> -	.feature_id = LWMI_FEATURE_ID_DGPU_EN,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 gpu_mode = {
> -	.device_id = LWMI_DEVICE_ID_GPU,
> -	.feature_id = LWMI_FEATURE_ID_GPU_MODE,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 dgpu_didvid = {
> -	.device_id = LWMI_DEVICE_ID_GPU,
> -	.feature_id = LWMI_FEATURE_ID_DGPU_DIDVID,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 gpu_nv_bpl = {
> -	.device_id = LWMI_DEVICE_ID_GPU,
> -	.feature_id = LWMI_FEATURE_ID_GPU_NV_BPL,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
> -static struct tunable_attr_01 gpu_nv_cpu_boost = {
> -	.device_id = LWMI_DEVICE_ID_GPU,
> -	.feature_id = LWMI_FEATURE_ID_GPU_NV_CPU_BOOST,
> -	.type_id = LWMI_TYPE_ID_NONE,
> -};
> -
>  struct capdata01_attr {
>  	struct kobj_attribute kobj_attr;
>  	struct tunable_attr_01 *tunable_attr;
>
> -- 
> 2.55.0

Looks good to me (I'm OK if my comment above is ignored)
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
