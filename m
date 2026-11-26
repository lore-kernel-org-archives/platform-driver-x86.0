Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695761;
	b=blrkTLKwb26w1eYMEs7nWmBQiyOn6wKZdX+wDDwb51xcDEnCaWU+MOwO4LHr402y+TFC
	 Oiz3B49SjY+YVr5frNAZWaDL4utwfnLcfFUX9meRecfc7JI6djg9ct7IvB08jXqw96VMt
	 DpJ4Oz32yPTL2isqW8pj5mCxRwWD6bv/Xb82+zvgDurWAHI/O0J4y4m27VG07HdKHbTl9
	 OQJv9SNEnE4e/tjHJLeOB5nDIdxquKBq0FSl4QO/jYgYsOHBVUQLDJaPWu3hl3VUpgTP2
	 F8wt+91ggPM/24f7uDuthOwufWVHNT8oFRekePDCfnxvOdLVJRElcT/qpGN2Df71cwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695761;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=qi4FF2QJ6KQO/hUNATzHnnLZPzy4jKrK/At4sLSpRdE=;
	b=0ecWrkSSf7OiM9zHnftWGHwTYGzzV14GtoXlWnV7pxj/zwqEAoCZurmMdN0dSYMKPw+q
	 oVe2CMEBhy50F3ps9QG5ihuKmf3q5Di5vwIutfVqu5Ylgd90q7D3K7CHGaz7WlgNE/Z+e
	 JjxqUAtdsy8dXuw9AfbGd4YpLthrkVJrL+/pSbBnur89qlsEWTN6XLR67axM+LuPkfRTs
	 K27LLGQpuEpU2mlw4qFcQThFW9mseFzHVWcCS+z+oX644ITQRFnTnWB0QJIevTA4uPVYE
	 0naIG37BnuAJUMkQhI8pfbIYbEJvqbiiI5L7nNmjVs5m69lRqs+XCG2i6HtU9t8fbqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=mUJfDtpb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDBE606A32D;
	Thu, 26 Nov 2026 12:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CDBE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=mUJfDtpb
ARC-Seal: i=1; a=rsa-sha256; t=1795695739; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TWp3DqpVErMmb5PJwklj20/6L9CwOKQ6YWcvWWLLPPmdbPwAgVJoHiGrZFjzHeo4cGzkljwH4eeFycG7Ep2WaAInbFs0ELKi17k7pkWfxif/JvqMHbl3frlChVCIqn7MUqf0T1B45SGojEaBf3h0BWXcNa/OPoxvn0N2GE36GHY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795695739; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qi4FF2QJ6KQO/hUNATzHnnLZPzy4jKrK/At4sLSpRdE=; 
	b=ELGhn3XwZUh5k8njjsUXNG2e2/c1THVMA0+hzLEEzKl1oz/O+Hld8wbRSbU3bma29vamqJ/Cvc+sYrdHPRdzdVPHY5iC0X2/iFrP51zEQgLvipFQMgYDDVN+pz2Ny0r9iN3f3vjmukakXJV4gznTsnHBPJjZj7BUlBIgwb2WVHM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=mUJfDtpbR4CqigQuBTaAtVXfpzutSuuE9N0PdtuqGVyn1XQEC5aI8yeDJSE4IBgWPElzItc5gCMA3XLKd+bjiTF+wjUib3mrX5u4PbcEOrj5PiQLY0dmYOhS+ucfq1LBcFCvUESe2/oAh4emlCWE+u9f51ISvurxegehDA8gJ5sRoLoF+m8eqUBlDiZZXjiGlMG7zlb7y6iTZ5ZV+9Qxv+/Ny7VMRgzcDC9645xq3SMvIMGN6plwf7qNGRX26uaGOR2uRl0bpDkHYLJBRrdpkLpI+xZ5PZLUO4i609pFI7cyi/KpfXytvm+iKmSRAe8N88dJEyxqarKc3XCnFI0IEg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=qi4FF2QJ6KQO/hUNATzHnnLZPzy4jKrK/At4sLSpRdE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179569573769159.776852180311266;
	Thu, 26 Nov 2026 04:22:17 -0800 (PST)
Message-ID: <845a099746be67e72abbed7b4a63d169a1c1ac86.camel@rong.moe>
Subject: Re: [PATCH v3 1/2] platform/x86: thinkpad_acpi: Update charge_stop
 only after it was applied
From: Rong Zhang <i@rong.moe>
To: Tom Hu <huxiaoying@kylinos.cn>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>, "Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de
 Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, xiaoying_hu@126.com
In-Reply-To: <20261126011058.39175-2-huxiaoying@kylinos.cn>
References: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
	 <20261126011058.39175-1-huxiaoying@kylinos.cn>
	 <20261126011058.39175-2-huxiaoying@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:16:03 +0800
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

On Thu, 2026-11-26 at 09:10 +0800, Tom Hu wrote:
> From: huxiaoying <huxiaoying@kylinos.cn>
>=20
> The charge_stop_threshold store writes the new value into the cached
> battery_info before the EC has accepted it.  If the ACPI call fails,
> the cache and the hardware disagree, and subsequent charge_start
> writes are validated against the stale-not-applied value.
>=20
> Move the cache update after a successful EC write and report -ENODEV
> on failure, matching the charge_start path.
>=20

I asked you to add a Fixes: tag here, but you kept ignoring it twice
without any explanation!

Thanks,
Rong

> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad721..8fc5569131f6 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -9847,16 +9847,15 @@ static ssize_t tpacpi_battery_store(int what,
>  =09=09=09return -EINVAL;
>  =09=09if (value < battery_info.batteries[battery].charge_start)
>  =09=09=09return -EINVAL;
> -=09=09battery_info.batteries[battery].charge_stop =3D value;
>  =09=09/*
>  =09=09 * When 100 is passed to stop, we need to flip
>  =09=09 * it to 0 as that the EC understands that as
>  =09=09 * "Default", which will charge to 100%
>  =09=09 */
> -=09=09if (value =3D=3D 100)
> -=09=09=09value =3D 0;
> -=09=09if (tpacpi_battery_set(THRESHOLD_STOP, battery, value))
> -=09=09=09return -EINVAL;
> +=09=09if (tpacpi_battery_set(THRESHOLD_STOP, battery,
> +=09=09=09=09       value =3D=3D 100 ? 0 : value))
> +=09=09=09return -ENODEV;
> +=09=09battery_info.batteries[battery].charge_stop =3D value;
>  =09=09return count;
>  =09default:
>  =09=09pr_crit("Wrong parameter: %d", what);
