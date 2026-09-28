Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847FE4FD791
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 21:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631186; cv=pass; b=Nl8jM8IdkFSvGUc5cvWsES89RBRsC9V0+I3TG4ke1yro14IH3mGDjG7kjW38JLiC+YSxmD4/ykzo9W2UEzP1zJkLEjOFOuJvT761eOdhfDew6cwVfXIjA6P+802C6ynvJa9M9eB4+kGnLxf8QtzVE7RgaXEyj5orinvndRvVpT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631186; c=relaxed/simple;
	bh=EA27YKz9impM5lVK/eI8Pn+cGv629ZkPNM+KYO0C0Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tv2CpNsb42O7IpNBqEFOrmiuXJVSTm+WnRWR4ZY+oKyh7Fk0esxm8vciRjJwNkdl2mJDTNFPTPyo7+q9LwQCkD5mx9BiRgf1h+69Z8NWjSldHO7UVJKc/0B8tQAry7nMchIiJ8j5MUroTd9su9EU5++Wj/xB7pFpTEhT+CDiLAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/qoVaES; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/qoVaES"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so546693166b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 14:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790631181; cv=none;
        d=google.com; s=arc-20260327;
        b=iXS5rcR0DOZ1HUPwxiqR4Mq7DlYEsN0VRfB/GYZLh2d21lbuFatNbS0MKIQyz56bjP
         bqrNC84z1amGA4uVd/GAxotmKRbinVavBbNiNbT5ijyldy4kUSsxHPursyCZV9uQDOe6
         ifnMk6Z5rHGNFctryJK7wlQrFT8dAM/kI8uFHGipZbqTcYeqjtHrXCePqjd0N+cJtqi/
         z8CCODEdYkv/Z3ePChUvOpbFC3COXxoLxlax5l/IUvIccmBZnt/AN9nVRUAwxVy21u1B
         GE6MlVSH1g6CNaQ8UjO7+BI7V8TLY+CDnTddDNK/UahGNkgcvmXiLWzxC0sMyo6M0v/A
         qx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pgy0F69XgkRODojgxpYtLEioAZBN7GxAhb6l/0w25jw=;
        fh=fPKNJjzuAOH3FUGHtLiC1LssVlFIn7FaA9IXFper2js=;
        b=F9MNJjZZEd4DyFmZhLEFmmxRbwes1uRbvFpmIIeN5jw9ngH1IFkS7kVgUJT0pqJ2yH
         F9NzppJJF7oX7t2tFICqw38hBOoG/NZ5eQanBg3qpShi3ZXkj2V4EVyFod060f445oAy
         qPNn97h+1SGgGsRQvGYJqABWCBONPL+sotiNSQ19eeJN4VeSDloS26yY5XJpjkmSF577
         unKy/qCGvSwbDjZZ4MNXXRY97ejmOg1JyTkLs1XEyqXSzXH35YAKL0CBEeXAM/xzLn/E
         +Fh3BbMSwRE1g5Zr3KCYd5BACyrdgmqaCjTwjF56V1pu21qKG3zdbe4XqseIqj0drcgQ
         rzCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790631181; x=1791235981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pgy0F69XgkRODojgxpYtLEioAZBN7GxAhb6l/0w25jw=;
        b=Z/qoVaESgQAUcg99LiBp4xtvNuS2mCiAwcVnWvKaHFqtekjNZ0dy3AEMqMxqbunmd1
         r5IfeVSXZF2WVFntnlifD4fRUeUu3RONK1QXXyFQT/LnPjzUFvNFjnLi1YvCGlae8wKk
         LNpbr4RzPTOnzcCBvrNSHSBcHMMzU1Jg2SaNtlv/n85Lu1yWoTb7Zvsxvyx+HfyVqRLw
         iMEry0mp4Lp5W/niNb/0i5nF05yqV2PTaapdFRJIDQLPeBFQXlBkoEdn1bT+FKUzW85o
         +2BGgRLSB8cykzavEO5tjEQbyfZS3/LOgd68GH4pVE9qlR+PfWyeSDPPdf6Y+2Q1rZeK
         NNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631181; x=1791235981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgy0F69XgkRODojgxpYtLEioAZBN7GxAhb6l/0w25jw=;
        b=L9wGS5auS22iRGXDaReApcPtqmbXrLrgz0flUFk4wSuk/uJVGNDu+pHybtbOjDZ4MK
         lDOgDarVxfhm0safWJqCwc3In8F1xIv3bmjHCqAZRaxw2glk+mT9E4WT2FSA1xBFQVQ8
         UsHkyu5grJouNw/BGIgDnbn/Tr/aW1AQp3JsBpk2EtHd1H5UCVa0eCzEkgLOsm2GiEc4
         IMtaqlOnohhjH9bSigrZ8Wg2VKto0DilA1PB/PuNCq7L315YnqVHes9TdV8zOd6bbc+r
         gTcCfe6+wjzxLCDDUXU9Lg0g7PfPahNgEWN8ESS0abfBzBnPHz1bnkByenSJ+jR85zWC
         g6jg==
X-Forwarded-Encrypted: i=1; AKwUvBydFQcatDn0Qcr5yJtinbqAfJKoDMrPLz3Jm6mGOdWkSGtZ9TBji1Kkofd8A2k3WaeHUVTS8+WwrvSADibLVfOZlIyh@vger.kernel.org
X-Gm-Message-State: AFuF++mPMWh+/xJ377dfKR/eDprw44VZSV5JCLyyYGBatca+Q3tVr3XD
	3uT7KoCuTl8NM/yLS32fvmkLel6/uFcjcuRDJRvwaRvEYdWwh5X45iam2ls83ioaz51XoSKa6qX
	o3e/wtd8uWqbzQKELLta8X9ryrMy3RSI=
X-Gm-Gg: AYBFou1s7Y2pa4Oo3yg/wPgiQ8fFlPF+gHJXUFfFcmB6w7L3rZBdsHpyVZ0CxlC6jX+
	oBWESTjnRgvktfs4Pc7qJatAfHnerLtH5dgZkxsS3899LSKJN3htTdSs5KuxIWqO07Gh2tEKVkf
	8DRZ/mr5I76nujFqN3gF3hDIpg8ZaJa8TrpGI9jVB75ujzRvOT6tKdsowvckm7joVp24WYWRtbf
	a3YB6L9QZ2IQdLds6hECsbG5RCeQYFshvDESjXj3GecfmkePoOQ+bGSbHXLOPo34Wo9XYXCAYdl
	hL8ixvKccs9V4eCPpToaoJVR+ezpubAzwvLrC7iw3dCv+qXEd9GaCEn2jPckOk8AYRvPMXW/4mS
	5zRnFV1NA0LiwbuOjx7GK/d9BF4nTH33etfTaGOwAxko3Hk0DVFuxGSJSB63OHud7xxE9v7AoXi
	oq26COhh/MP3p0unGgOFZ6s+xIBycLwdpL+75PY78e
X-Received: by 2002:a17:906:6a04:b0:c2d:d89d:346a with SMTP id
 a640c23a62f3a-c2dd89d497amr349572966b.3.1790631181365; Mon, 28 Sep 2026
 14:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928200318.63383-1-meatuni001@gmail.com> <20260928200318.63383-3-meatuni001@gmail.com>
In-Reply-To: <20260928200318.63383-3-meatuni001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 00:32:24 +0300
X-Gm-Features: AclHuK9jufUluVP0aI50nLvoQUmzoRhFid92QksQpAfKio6g-wKWdy9HiOsdwUA
Message-ID: <CAHp75VeLOAs_hZUk5aX8O0Cktj9oc0MP0QEd-eJPmA8s_6NSCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] platform/x86: hp-bioscfg: fix non-ASCII truncation
 in hp_get_string_from_buffer()
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:03=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> utf16s_to_utf8s() writes into dst, but the manual loop that follows
> re-walks src from the start and overwrites dst with truncating casts
> (dst[i] =3D *src), discarding the UTF-8 output. Any code point above
> U+007F produces garbage.
>
> Replace both with a two-stage conversion: utf16s_to_utf8s() into a
> scratch buffer, then string_escape_mem(ESCAPE_SPACE | ESCAPE_SPECIAL,
> "\\\r\n\t") into dst. Passing the four characters to @only avoids
> escaping quotes, leaving them for the existing strreplace() call.
>
> Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).
>
> Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Wrong tag. I have not suggested the (main) idea behind this change.
You're not supposed to arbitrarily add some tags without respective
consent.

> Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>

...

>  #include <linux/string.h>
> +#include <linux/string_helpers.h>

You can replace string.h with string_helpers.h as the latter implies the fo=
rmer.

...

>         u16 *src =3D (u16 *)*buffer;
>         u16 src_size;
>
> +       char utf8_buf[MAX_BUFF_SIZE];

Try to preserve reversed xmas tree order.

>         u16 orig_size;
> -       u16 size;
> -       int i;
> -       int conv_dst_size;
> +       int utf8_len;
> +       int escaped_len;

--=20
With Best Regards,
Andy Shevchenko
