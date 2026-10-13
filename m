Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507E51D518
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 17:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911699; cv=none; b=syhbITpiVyCrnKVoH3tZzuzoAmkW0o3GPhtCFCqyFsEX6IrdSXbqz7zPEMtStuc5vt0bko4C9Ly7AWeyqR0QOFWTtHjns9/57mVDh1/eZha/fcwkpJAfmU00E9e4xULgS8rgUkRZ9ne86Y1ysfEFzMSXH8wgMeXpPseGVwhshvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911699; c=relaxed/simple;
	bh=1VrtYnlTdJeLZ/vqzNXn8sl/e4cmUeHNbbBwJRrJYdc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GzvkRemVLXdEAXJrYYd9XcxScWN3RezzzNs1rnllyIuM7qvF164htXBh+bq/3SWhdvNa1yEUNWbTFYNcXW1dhIUWRfEkR+QXiQtC8/TeD5I7/74E7VKfKdpsWSi8z4wuw6Lduyryw+31tNatYgDJ799tzC0KYUCRPW/dn5hYqGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=gPvgT+z+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rGsHJy6/; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="gPvgT+z+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rGsHJy6/"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BB775140016B
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 13:14:55 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 13 Oct 2026 13:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791911695;
	 x=1791998095; bh=3FlF1G+KcEHJIr2FkyRYgfz7rew4XJRTgG9g3R4uwfQ=; b=
	gPvgT+z+tnbwqpme9IP6VOEbZe8A5neal5bG6snwTP1iEaP1FgvQBhQOwRyyCqeO
	/ITt9Ig+maFNv78vpnJcromfQLDfsNI7yw2X9CjA8x2twVC5aM+iE77lJcwqd23Z
	j0EyCa4ddKqIMhE5W0KHu7E+TiwvU1VDpzzTYgLMWgdJbbUM+LEYBTmyJ0hJSrR3
	x3/HeTS3Z9QYLuU/UZDytppMnHJG5sqWcg0oa/OiFiKbAsthW3RaVFaLEkTS1uku
	spiJM5VlVmTV6B5TDuRa64aehvIMLDJFqyb8n76TTjjwz4dufXPfeR95uPTg38r6
	+QM2unZ2n1kgk556tp4s0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791911695; x=
	1791998095; bh=3FlF1G+KcEHJIr2FkyRYgfz7rew4XJRTgG9g3R4uwfQ=; b=r
	GsHJy6/FQBWTknWtgAUmiVt3khwpd53dxZlhMELt+GKZHf6bmWEck5IkqJeVLv4W
	0yTfWzwtl4zXPPkzgmilnphZ/3LbxtQLner4maaDZWc6j0S275ol21uw6f8DCo6+
	ZKlxCP4g3HV9h+Xl2DIoaOSsx18W4ISPQ/TyMxUZF0hqmpJEzp43iXgKIKEYlHep
	Q/X8bLtE937Xgs0lGN8e1ogC11H1fC0PJK5az9GiVKHPqzMLJfznBsY3ZoGpfq0y
	HMZ2KkmcHbxNI1IdzCw5b4hyA0pWUo+2FsbiZmjMQ955f+ty8H2AorAqS+IRQKC5
	bQYMOHlVYGzKEq9P7tsKg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791911695; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:cgcSyxHRR6D8NPwa9fqHon7W04cOB9Um/T5HLAzFqryXGC2
	AeMERoZmPVyivpBsgFlDGlI73ZWnV9ccHgnSoECGzZARYlln/2xZqkqReepNN20s
	jqQBqZ8dGpRVpMNyLRB6vaKX4eTM26myE7OQVvKkeNV0h5o7kZWiFgPb0q/e4WCF
	apk6iqujKShnb9lvIja/TTOZsQzzpnHI4r8oIrQwBb49Myo7Zei5JE5anpVez7Uy
	MAYFIRs17WZxRC1qpN2iNgIqNBwoEiuMk7hIMxtdJK3Sj7OOJLe4C/IYGCiDr8gW
	cd4jZfjED+hcDQdy1V0HsbdwPEPKeSB3Qlziddw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aPRReYutXN5/7N2rtIluJR4+0127LIGfO7m9iYmipS0=:1VrtYnlTdJeLZ/vqzNXn8sl/e4cmUeHNbbBwJRrJYdc=;
X-ME-Sender: <xms:DWfOar1AWY--CbfTUFqvGkF0vFJBEjlS47AhbjztQ2izhTFZUcW3Lw>
    <xme:DWfOak4y9aiaAF7HVhobrlw3lEVQb3hkFCjrLW4JcZz5zZZgasW58exnc_OrT0iE2
    oqmsbzf7vYDeNnOZfer-s4SdjHXg5T4ByA-3dcku6_c6P3ilrke9A>
X-ME-Proxy-Cause: dmFkZTFDvlWDMhQ0CjBHlWCnSOgj4K1p645fC/lo9O/Lrk2iNb/TRDtuiTpvcQXBqmejT7
    Ws+g8bLUfnvw1GfLltMVBLXaL+Oy70i/XpbQ4MQ6lxXxuNDAFaqkILzdE8MZONx3veSkBE
    LJ+ag8142GRkeNQlf2VxcV0XDjfch/vBEVJ/CgGsmesIQpdUzoPIIhZMNQvapXozwoJZVg
    vfIaJFOBZosQkAMcb6a6+ED7NGm1Nrgpm4csdNG3oYEmUC4AQhRoUJSv5l7ccf4loAXYRT
    zG0T8B2KPLM572bD9deC++vGSMe+YgpdegvUWrzrLHWBLf3wE+cDkVSJz1VziYHSmICGpx
    NdaLB0dI7FRRuC+mNAKak8T7RVWyiC9t4PR9EV8nFvyk/EhdFeq+4g8sAMeku0nv/xSiA7
    JmkP3Pf1d82KR8YFPD9rJBlx8qadlks3GG0GfNvGLjTBH4uoR9af62sZWYCqX9jgdA+WGM
    OKEJxKb+2ps+CmIQbR03lnY0YlYgYwcVabFJmIlXLYVqSjbxp4GiymAgfqIBIODWJ0XxVu
    DPjTBNUgE4c9Ij5O5m0j7EVfUd2Mh0DwWfEUAwZPA+tWf2Vs+sd/fJGOg43Kec8a0puK7B
    JacIQS74mjagbPhPdINUQZIjeXBKF71TRnJ9oWrkReZVxwIhdSCPhKl8vmZA
X-ME-Proxy: <xmx:DWfOath9SUUIcqIHDJ0gQhlpo39u59GD1Cxppyim8SjP1biAMwGfyw>
    <xmx:DWfOao6Lp_WCfhC64lVNqg5agUI-5csDX4r6YUhRUO5qUOv4DMDrnQ>
    <xmx:DWfOalaSso2pPyZrfQq99338JYuT0pzZ3KdDkVe55EYDAu61T0GZCw>
    <xmx:DWfOat68asUp4A4a9gf9b1henMhbwHqzjN01U8j3QA06zAHhLa1NLQ>
    <xmx:D2fOapp_AkiCXhcGWxSVKDrTgj-Elyhgk7lK9r8u41IWDNxaH5AP9dS0>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 8DCF32C0007C; Tue, 13 Oct 2026 13:14:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AFvlYNutXlQ3
Date: Tue, 13 Oct 2026 13:14:33 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Huang Wei" <huangwei@kylinos.cn>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <b8cd4c7c-b7e7-4aab-8ba9-a16ab4ea345b@app.fastmail.com>
In-Reply-To: <20261013070740.789934-1-huangwei@kylinos.cn>
References: <20260918161539.2676619-1-huangwei@kylinos.cn>
 <20261013070740.789934-1-huangwei@kylinos.cn>
Subject: Re: [PATCH] Revert "platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to
 non-standard thermal/fan quirk tables"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Huang

On Tue, Oct 13, 2026, at 3:07 AM, Huang Wei wrote:
> This reverts commit bb0f3a5d6b9844b70ad696b9470762028f6d86ec.
>
> Lenovo's firmware team has verified that the X9-14 Gen 1 uses EC
> register offsets that are unique to this platform, rather than the
> shared non-standard ECFW layout of the models already covered by the
> quirk tables. Applying the generic quirk would make the driver read
> the wrong registers and report bogus temperatures. Lenovo is working
> on the correct solution based on an updated EC register specification.
>

You're fast :) I was going to say we'll just post on top of your original patch now as it's been accepted. Didn't want to create extra work for you - but thanks for doing this.
I'll let the team know to get moving on the proper fix - there's been some back and forth with the FW team on the details.

Thanks
Mark

> Link: 
> https://lore.kernel.org/all/000acb24-7aef-4718-89ea-0dffd1ab34d9@app.fastmail.com/
> Signed-off-by: Huang Wei <huangwei@kylinos.cn>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 498139ac8f4b..6dd7c28fc0db 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -6021,7 +6021,6 @@ static const struct tpacpi_quirk 
> thermal_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('R', '0', 'T', true),	/* 11e Gen5 GL*/
>  	TPACPI_Q_LNV3('R', '1', 'D', true),	/* 11e Gen5 GL-R*/
>  	TPACPI_Q_LNV3('R', '0', 'V', true),	/* 11e Gen5 KL-Y*/
> -	TPACPI_Q_LNV3('N', '4', 'D', true),	/* X9-14 Gen 1 */
>  };
>
>  static enum thermal_access_mode thermal_read_mode;
> @@ -8846,7 +8845,6 @@ static const struct tpacpi_quirk 
> fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('R', '0', 'T', TPACPI_FAN_NS),	/* 11e Gen5 GL */
>  	TPACPI_Q_LNV3('R', '1', 'D', TPACPI_FAN_NS),	/* 11e Gen5 GL-R */
>  	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
> -	TPACPI_Q_LNV3('N', '4', 'D', TPACPI_FAN_NS),	/* X9-14 Gen 1 */
>  	TPACPI_Q_LNV('H', '3', TPACPI_FAN_NS),		/* Edge E330 */
>  	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd 
> gen) */
>  	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
>
> --
> 2.25.1
