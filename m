Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6387191
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819616; cv=none; b=kv2JAtediR2Qfp4raGvkRgMwkSgeQtLRR7FGq1xiZ+PARjo/POUk27bDwXNGOCsapUpb5h8ISzmYpnr4jn4t1nDcw8ppE1FIeh8CJIwEXyHU6knBCEgw59gFnlN3yEC8IdcsKcQp1w6hSms5RclZjT+KFylbdTgJBYqedX+6woo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819616; c=relaxed/simple;
	bh=2YjBs9tSD1hFYbCuNRkilvTQsFvKVZgZc5Vg3MCVMOE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=CjRXnfWf2PqsQPm56EbRAkyiaTL2DkW0Lg2VHKx/Q5GxgKP17Ey59vjNnUz7mXNWHDdomgFmuKQc9kS/bdsqYbAu9uDtIeZaYXMOjHEv+x0ZmJRG6DcXNV0xcRZ4fvEAvCnlYhDyaBPZPmmw0q49bTxjNLNygnqP0/aa4sYTAVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MESynZwd; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MESynZwd"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso3816006b3a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744819614; x=1745424414; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=borFec4IkWLBQbPHERZDMJQiVSo/G13P6HaPug59uvs=;
        b=MESynZwdZrUljVZME1r/cDozbzh4Hnimyh23mBjGQbl5+cyD4fqegHfe79ktkSWeCU
         F2bZLzgK7gcehw+Xz5pQudeVXCJSTR7VX7W15J923cU3OxJEPKN2PRevfIy7Y0zk/zGm
         L0lxOiKQ1T+fq62EC+ZkKaA0G6jpiOJqNGA4h9k7ly5UYJpKiY+xKBnRxPDisTGgce/L
         UC3PIr1JcNL7vXtEQ9m9EZe3j8b3KEPSyJyY0M9xceuwKnwL8VkzqMC2skENr+YmiWMN
         LTfq+XHEcryYN+nAnMBsYmvc7QwQhxVKGTrwOorctEWcysO/nlJGOKTuhI1FKranZlgB
         EERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819614; x=1745424414;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=borFec4IkWLBQbPHERZDMJQiVSo/G13P6HaPug59uvs=;
        b=m8W9UNI4Q0TVwdbKVxIUNJX0G63sRj/wb2XFiU/kvk57KmMAnRJORqv6MXo49BuOq2
         louNi4SHR0taEGNV2SoaMRR6f43Np4IFK+h318wCJl0gju8dcUdMUsohQP+6YyGOuaKY
         r0gpxs05JF6qp/ECpBJGznDFhLO1Vn7KdY0AKX1PcYxb+j/p3p3bXzh4L23JOk5Ll707
         cjUC4+GSndRo/dtQAVEDDjb3wpUzCzWxI4KAK1K+lO3dtkAZqzl9+ysQh13RUJPXCVLd
         vO/uaoEwxbGnoj/qlQ/yG02GZR5XQ/SHumRRTo7HwmXQOkknU5GBZ29x7BoYrPUfuIw3
         XRow==
X-Gm-Message-State: AOJu0YyEV4i845R1SlM5OtKpaBa1MeKTRP7xlP6UjVl6adv3MsxJgF+2
	e/fxuADMY0+2iokoOCX61xcLaWCB0UmSFLS+YOxMUCDKkRSlwp7e
X-Gm-Gg: ASbGncsqslbpPvX75NdVLCRqWPYssE5tL1C0jq5B/cmnCn+QHrAOev5cKi61exzsvJz
	DfX8HhISx2PBKf3CkLfjR32+n0og8k6Jj0INkEXlBR8K0uuLpx/gy5BmJRx/Z9Fkhow0oVF56HG
	4GH6Zx6iGW8O3zg05hnzYCOuy6apmZdH5bBIkgm57gAGuhkF4DqMerHCvfk9cSL1+GJfJm9btJj
	8zYyCMzVG6F4XRVz3DdJlYPaq6H7z9TM9hBJyNjyzqG00u3a7leBjzNbz/I/+N0rScTUo8boe8c
	WgU9AViGrN7TkEEHb9na4lDvGpla3/WYOQ==
X-Google-Smtp-Source: AGHT+IHDkKkS6VOWPBoGH/oZXgVl/D3i049JHCA5AiKZxBI9aG+2mB2XoXAeVDU1hu8V7jp4ImiZPg==
X-Received: by 2002:a05:6a00:4ac6:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-73c266b5fecmr2855951b3a.2.1744819613855;
        Wed, 16 Apr 2025 09:06:53 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f10f4sm10604140b3a.113.2025.04.16.09.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 09:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Apr 2025 13:06:51 -0300
Message-Id: <D986XJWG75SP.1HQBCROQOG35W@gmail.com>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>
Subject: Re: [bug report] platform/x86: alienware-wmi-wmax: Improve platform
 profile probe
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <Z_-KVqNbD9ygvE2X@stanley.mountain>
In-Reply-To: <Z_-KVqNbD9ygvE2X@stanley.mountain>

Hi Dan,

On Wed Apr 16, 2025 at 7:45 AM -03, Dan Carpenter wrote:
> Hello Kurt Borja,
>
> Commit 32b6372ddd43 ("platform/x86: alienware-wmi-wmax: Improve
> platform profile probe") from Mar 29, 2025 (linux-next), leads to the
> following Smatch static checker warning:
>
> 	drivers/platform/x86/dell/alienware-wmi-wmax.c:1217 awcc_platform_profil=
e_probe()
> 	error: uninitialized symbol 'id'.
>
> drivers/platform/x86/dell/alienware-wmi-wmax.c
>     1191 static int awcc_platform_profile_probe(void *drvdata, unsigned l=
ong *choices)
>     1192 {
>     1193         enum platform_profile_option profile;
>     1194         struct awcc_priv *priv =3D drvdata;
>     1195         enum awcc_thermal_profile mode;
>     1196         u8 id, offset =3D 0;
>     1197         int ret;
>     1198=20
>     1199         /*
>     1200          * Thermal profile IDs are listed last at offset
>     1201          *        fan_count + temp_count + unknown_count
>     1202          */
>     1203         for (unsigned int i =3D 0; i < ARRAY_SIZE(priv->res_coun=
t) - 1; i++)
>     1204                 offset +=3D priv->res_count[i];
>     1205=20
>     1206         for (unsigned int i =3D 0; i < priv->profile_count; i++)=
 {
>     1207                 ret =3D awcc_op_get_resource_id(priv->wdev, i + =
offset, &id);
>     1208                 if (ret =3D=3D -EIO)
>
> -ENOMSG is not handled.

True.

I'll submit a fix for this. Thank you for reporting!

--=20
 ~ Kurt

>
>     1209                         return ret;
>     1210                 /*
>     1211                  * Some devices report an incorrect number of th=
ermal profiles
>     1212                  * so the resource ID list may end prematurely
>     1213                  */
>     1214                 if (ret =3D=3D -EBADRQC)
>     1215                         break;
>     1216=20
> --> 1217                 if (!is_awcc_thermal_profile_id(id)) {
>     1218                         dev_dbg(&priv->wdev->dev, "Unmapped ther=
mal profile ID 0x%02x\n", id);
>     1219                         continue;
>     1220                 }
>     1221=20
>     1222                 mode =3D FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
>     1223                 profile =3D awcc_mode_to_platform_profile[mode];
>     1224                 priv->supported_profiles[profile] =3D id;
>     1225=20
>     1226                 __set_bit(profile, choices);
>     1227         }
>     1228=20
>     1229         if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
>     1230                 return -ENODEV;
>     1231=20
>     1232         if (awcc->gmode) {
>     1233                 priv->supported_profiles[PLATFORM_PROFILE_PERFOR=
MANCE] =3D
>     1234                         AWCC_SPECIAL_PROFILE_GMODE;
>     1235=20
>     1236                 __set_bit(PLATFORM_PROFILE_PERFORMANCE, choices)=
;
>     1237         }
>     1238=20
>     1239         /* Every model supports the "custom" profile */
>     1240         priv->supported_profiles[PLATFORM_PROFILE_CUSTOM] =3D
>     1241                 AWCC_SPECIAL_PROFILE_CUSTOM;
>     1242=20
>     1243         __set_bit(PLATFORM_PROFILE_CUSTOM, choices);
>     1244=20
>     1245         return 0;
>     1246 }
>
> regards,
> dan carpenter

