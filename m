Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795529393;
	b=PTQ4k8GCZumcQzCa3rm8C+OYdA00Wi5j0aBPM7xm2y9llnttq5LIKw0ZhlMVEJuacqQb
	 Cf5WC6V0XRiO2BPyDtKpsYe8KEhaxOJK3nhdBeoyaYdmyonjJeR4odcua8IV1sK5GKV9N
	 m/ScHym7961WVDAP/EAb1q54pw5Tjjajjbj4CJ9Mlh/BzCjXkSO2+3k2xRQMRV+uMdOKp
	 nXJxUesNqaSA8TKCiQaqWZ3RpIBaI83ZcpkvDzT/GtyiR29IVPdVtp6vpLld0+uqVF7JF
	 EJXeNea4ea6prtvDuy0PLgU/O77GrCWluea2/ueWJuunphFSJ7SdxiMPEErU8adqblQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529393;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=a4RfNBQTBp/UFVGqh2i/392nxbtU56+kwab0+TxIlZw=;
	b=U7+FY1aABlRfiyFCA7epypDs4nSe+Ofy+FHYg2XWf0SA3IpafP5K3vtAwTGvRfF3qZLa
	 uh+gEMn+fzJKh7RdxVC61oKyW5IxI+o1/xkeDNxMmlwhzrcUyc+awfTG5oWvYaddsV+EW
	 S1HO7v0v9Zt8GRtIGnFk3RCJnofPrOWcbv/VP5gl9vwuEitEg5pYTHNm4TNrIjgXJiv7B
	 JzS5xmWJtCkmokJqqZBB25LpLcgEEI3syW54/qwIvFA+djzkvh0itoUhsdf9uz7SJUBdw
	 Q83sugNfz7MLjwuBXqVgOANKjt5C+nIqRapGDrmgZj/+/TCbGuTRIQqEoYjVvoeOlLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=lvQ10+Ef;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA63E606A697;
	Tue, 24 Nov 2026 14:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA63E606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=lvQ10+Ef
ARC-Seal: i=1; a=rsa-sha256; t=1795529350; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g4m5swNtNX2Wa/Em07Orl+751l9WyGQB/ouMSuznju+lZU79CJMrQcz4aGYKh8vgD9Ctb0+yha+Tzv0PS+ex6kYioxcd8/Xdai5xx8CPrQL2rlaS0y+3Soxc4vFA1uPl5yDMa3ntU1NcHdZJD3O1BiNfQdBMAxsdxaFiPKMMvmI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795529350; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a4RfNBQTBp/UFVGqh2i/392nxbtU56+kwab0+TxIlZw=; 
	b=FAUJgi7NZlXDBLsTCviKlvzcoDMPV8Or7I1C95ndFsveAlrrqUtH+Zbqx/XBQ5LhKYPDiTvEeBxtsetfUba9dTbF2Gmg/Tu5Ocp8Si1E8/ghEGflhoYoRW00y8jUNE3d2yvNBI4moynRffMYUM0XcLyhVyhIuiq0hDDb4pgn7yc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=lvQ10+Efyd7eU4BlGQ6BOxkaD+Cb1mWFrO5MMj2GRsfluN252iAAspGhbbfpfnEhnO8F9gciNx3JyDOM2wpC0VMbyVxv0bcGbup/8fsX7spoNqocezpi4p1PpSsZyW1TJ4bOE7Z3ROWgWaHBcOvOy4k70fLs4oa0VwFQzuZ/yc5wpncse8rtatr+rQ3wCgr37byF6pHGljDC2iuNZMUQfoQkyk/LmJr10mDdZBxqR72as+iUlmAeeHwgk2r9D3xAODjxCsWVUcCswdDkt0CpuCOPkZ/DqceaZL/UBkeyxb1H30rycIS/JBBorDfThnlSITLY5FKkVW6CSDZDTUen5Q==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=a4RfNBQTBp/UFVGqh2i/392nxbtU56+kwab0+TxIlZw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179552934634154.10946730104092;
	Tue, 24 Nov 2026 06:09:06 -0800 (PST)
Message-ID: <d776d4ca05cd2378e344881b82725fda168f6556.camel@rong.moe>
Subject: Re: [PATCH 2/2] platform/x86: thinkpad_acpi: Only check
 charge_start against a known charge_stop
From: Rong Zhang <i@rong.moe>
To: Tom Hu <huxiaoying@kylinos.cn>, linux-kernel@vger.kernel.org
Cc: hmh@hmh.eng.br, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, xiaoying_hu@126.com
In-Reply-To: <20261124103946.897642-2-huxiaoying@kylinos.cn>
References: <20261124103946.897642-1-huxiaoying@kylinos.cn>
	 <20261124103946.897642-2-huxiaoying@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 22:02:34 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Tom,

Thanks for working on this.

On Tue, 2026-11-24 at 18:39 +0800, Tom Hu wrote:
> From: huxiaoying <huxiaoying@kylinos.cn>
>=20
> When the EC does not provide GET_STOP, stop_support stays clear and the
> cached charge_stop is never probed, so it remains 0.  charge_start is
> still validated against that value, which rejects every level above 0
> even though the start threshold is supported.
>=20
> Only apply the cross check when the stop threshold is supported.
>=20
> Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>

FWIW:

Reviewed-by: Rong Zhang <i@rong.moe>

A random thought: perhaps initializing charge_stop with 100 could make
the code cleaner?

Thanks,
Rong

> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 8fc5569131f6..842045272ffa 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -9832,7 +9832,8 @@ static ssize_t tpacpi_battery_store(int what,
>  =09=09/* valid values are [0, 99] */
>  =09=09if (value > 99)
>  =09=09=09return -EINVAL;
> -=09=09if (value > battery_info.batteries[battery].charge_stop)
> +=09=09if (battery_info.batteries[battery].stop_support &&
> +=09=09    value > battery_info.batteries[battery].charge_stop)
>  =09=09=09return -EINVAL;
>  =09=09if (tpacpi_battery_set(THRESHOLD_START, battery, value))
>  =09=09=09return -ENODEV;
