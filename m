Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795258245;
	b=EXWgYWin92y14bP+Lp2VuLEmLetF9bYRJuhnFOZT5ktI5cQsDED/GJwR3Fi1b3zJFZiN
	 Q1TeS4N1oEoYEdithT4U8gVqmxPtxJnhPlVNK/Xk16aUN4YI4MUCBqmDh0Ns7nqZZpVf7
	 WuKwpwnjLh/tW0MIny+TRZE/i9Luqou5HcowxNvVhfol1tKqoo4Bk/mjiASGxjLxsZZkh
	 xgSNi54pC1Yv7SIQ5wt/3M12ACigQeRjGrE7zLy7LL677zIy/SgkZKa61TeOPLV0gsYB6
	 oRdyqg3h68aJOCEj+bxdko8so9anY9sEtsS+EFiCrPz7/grbZALtKpUBy8dtW2vxtYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258245;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=Ywnc0CTZOV3pbLzdUSs5Z9tSv4Vo3Fp1Ux+4oxaBsmI=;
	b=vZs5IsP4L8jMMowZDM79A/ihGZJc7MLketuSEIs36uAMnjD2kmhTMhB9w70KAhFvMbw2
	 QEmxiLamRMcXp+34fH+vzAQoTswCQPf3bdliM+KX9c/N0T9wZx6l8rgFKnS+VVIumlWA6
	 BhielH4oxTCpA/IH75/nSdm2wYff2ru2hsOY4ywbOXwwwqBfQ3ZYT2zvK3OGHB+x03X1E
	 zxUx00XK286+9cmoJEMlvOVSMRv+PwfYJDQRnTVPi05K5pDKSGvmBQnmYGr17vuv8iF2K
	 OiOE5jS8Vl6Jy2CGBg5nUdgHEAIEILNRKSbBOrzXVXhS4zYYm6n6DGD5A1ZXTfwES0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=KbHY7d6B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C240606A320;
	Sat, 21 Nov 2026 10:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C240606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=KbHY7d6B
ARC-Seal: i=1; a=rsa-sha256; t=1795258233; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xv0WLLHlFqE1dSPAITov/L4a/rkxxFBjp6NQa8FdmYbtN45aqPdy1B0JJpHIJ9z0PQbXsf6BTWBhPFMPkWEwvgZvbh/6hSEkrGtyPx2pj/H0fIZr/h6MDbBmGonvsHGiFyxPP37mvUpjah+/DRylrJrn/MNMpG6E7YAXnGF76CM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795258233; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ywnc0CTZOV3pbLzdUSs5Z9tSv4Vo3Fp1Ux+4oxaBsmI=; 
	b=WVB5NBSK7y79U/8mZhYvV2jUkiDNLdKUZWoxxiADM5oPsCCZQ5mUGoxlJ9C9GvNismzH6zDPw8ThowhDpmQ1JYTyvWoRgqvcNUTj1Oc7y2wM01n3HihX48LAMP+1VLx/bYpJynZPwnD3jqRz5Pg9ZN3Gri3L0Lk1zBQ5BAbb/h8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=KbHY7d6BbKuKxNDy7NR/JqFOyG9XMA8g1ru0FT1wuLOhWxFOCJbaS3jH4VeQI7V2O7lxyTPhsDJ2ThMo5Y+uxe99AeoIGBdzvzPCxwtgb8ahPMgP+8Zd9/5x+fsT69uYYNRQhN8nJA7VJLIPQJh2jlPCQBxAMRshJXdUp5/VdLEsumWb7ZmeSx+FdyTckM4WVqnNM1qbhKvYApUXkmi3K9eLK5msi1MoKLIGFQ4cDkijn1no8aDGb2izav5sEiGIO70XVpiI8TIy6VOrpavqbYL3pX97ev9mzWOS3P4IWWQYmKMXshQ3h440gbANEL7g1zPe9ZDCRjfpmhkWWJQDbA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=Ywnc0CTZOV3pbLzdUSs5Z9tSv4Vo3Fp1Ux+4oxaBsmI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795258230846802.4236118435841;
	Sat, 21 Nov 2026 02:50:30 -0800 (PST)
Message-ID: <2066ef36b62fa875914753b43124e668d8de47ea.camel@rong.moe>
Subject: Re: [PATCH v3 3/3] platform: lenovo: wmi-fn-keys: ignore the
 keyboard backlight level events
From: Rong Zhang <i@rong.moe>
To: David Cemin <dcemin@nvidia.com>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
 xy-jackie@139.com, 	marco_giunta@outlook.it, ldemarchi@nvidia.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261121033322.974635-4-dcemin@nvidia.com>
References: <20261119022719.3089229-1-dcemin@nvidia.com>
	 <20261121033322.974635-1-dcemin@nvidia.com>
	 <20261121033322.974635-4-dcemin@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 18:44:32 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi David,

Thanks for your work.

On Fri, 2026-11-20 at 19:33 -0800, David Cemin wrote:
> The Yoga 9 2-in-1 16 reports the keyboard backlight level selected with
> Fn+Space on the Fn key event GUID: 0x40 for off, 0x41 for low, 0x42 for
> high, and 0x43 was seen once while cycling. The firmware changes the
> backlight itself, so these events carry no action for the OS; add them
> as KE_IGNORE entries so they stop being logged as unknown key codes.
>=20
> Signed-off-by: David Cemin <dcemin@nvidia.com>
> ---
>  drivers/platform/lenovo/wmi-fn-keys.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/platform/lenovo/wmi-fn-keys.c b/drivers/platform/len=
ovo/wmi-fn-keys.c
> index 330de9529a87..21d36e798ba5 100644
> --- a/drivers/platform/lenovo/wmi-fn-keys.c
> +++ b/drivers/platform/lenovo/wmi-fn-keys.c
> @@ -108,6 +108,14 @@ static const struct key_entry lwmi_fn_keys_keymap[] =
=3D {
>  =09{ KE_KEY,=090x2d | LWMI_FN_KEY, { KEY_SELECTIVE_SCREENSHOT } },
>  =09{ KE_KEY,=090x29 | LWMI_FN_KEY, { KEY_TOUCHPAD_TOGGLE } },
>  =09{ KE_KEY,=090x2a | LWMI_FN_KEY, { KEY_ROOT_MENU } },
> +=09/*
> +=09 * Keyboard backlight level after Fn+Space, handled by the firmware:
> +=09 * 0x40 off, 0x41 low, 0x42 high
> +=09 */
> +=09{ KE_IGNORE,=090x40 | LWMI_FN_KEY },
> +=09{ KE_IGNORE,=090x41 | LWMI_FN_KEY },
> +=09{ KE_IGNORE,=090x42 | LWMI_FN_KEY },
> +=09{ KE_IGNORE,=090x43 | LWMI_FN_KEY },

Could you please place all KE_IGNORE entries together? I.e., following
0x03.

With it fixed, the patch looks good to me:

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> =20
>  =09/*
>  =09 * WMI switches
