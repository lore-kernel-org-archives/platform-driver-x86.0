Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61116306B3B
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 02:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774491176; cv=pass; b=VXTP1Y5RbxoN28+Iog2OwJs09/M1wt5VKx+6FIz+uN0ZdHnOH6TnPAIQVEa7L+R1OwAx0rfOBSll0ai/TFIe3SED9cVBfP/1tcmjYctmxp/P4zSkfrwsJgVVhmLAJMe7cpfpfqM9bmJ6rBEUyjDw09LyG1yr2yzNpHJ1X3v0YNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774491176; c=relaxed/simple;
	bh=tv5nfp1dvu/Tkr8TpVf2gegTD+Ef12uY2ylzmRm9r14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZGVeGHj1ktjkwKD3UKIeQTtOchT4ZDZ0Wsj0XKt1ExuldroyrZDkN1/mYiU/OYHcnDf6sUdNXPZ7fxdo8oevhuz+3u7MZ210XHbeFekVG4vSvZCV+Rt9AIixBW01WhJBlyCs6CDp0qbbx4wErOPMLQbi0ZUokTuWmBEvmw+/yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adEt66Yr; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adEt66Yr"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89cc68655f8so4877866d6.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 19:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774491174; cv=none;
        d=google.com; s=arc-20240605;
        b=RxrSkO5VLD6WMM9N6XNACndHVifwyIynYW65iU7caaievXy7Ktwe/bhpBfEn5Mlluv
         kbDMNiowdPTUSGys7gLOlLppdlXfkPRDR3hHk4X6UrRu+4ZQGvtotOhcpBPvv6aRd/8n
         Uk1ErSfKyyCzRIzhT3mUm/E/0DMUuo2l7i06RkSa3DZfKO93Z90WVBmZDs3sQ2q97arI
         FlGzQDjBeG97D0jJdtS4arLzpSU2GJN6LoJgr9kxkU16AP1+oHIR+dX2QMBEs+1R6ZwU
         ahckg0qYKx0NhU9oI3sS+uapMwhgyLSbRBmy1Dg13NCja2pt27uz1eAzRpS5o/Ir8bJc
         /bwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8LZz/ifoYRb/n1L6k1t1xrO6vM8B/9SjmCeNM7ARg2A=;
        fh=r3K3ideUPiRvprmuzP4oEd25vzbDgxQgjKDko4P1bIA=;
        b=T3pkJqzSPrAVoKjkNyD7P2HKMvVLHHoVIBLDmzh3oPu02ZCFqyOlbA5mC/q6CNVZcI
         2OtecijMx7Uk2eNRhs3nNo+41DLfkhSwhwOwcNgYPZGGRmc0LUbwtdrgqBg0+y9ixDKx
         Sk8VCS02mcOwMnkLx8sn0Xeoin1W2U2guXXocMOlZs0W64Lt7OWyrifVffGi7Ae0tCm8
         BAwmKegXAOxJ14nongshBsD7m44QVwzTe8iRqMwQT8N1EFy04pCjcg6QxGftZQxFDEOC
         hWU/pAUILi/LO+T2/yN1SEx+5kMD20sctY/rhUKylKh8f/zsbHVIVNC0EWNhg0FuKoMy
         +jgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774491174; x=1775095974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LZz/ifoYRb/n1L6k1t1xrO6vM8B/9SjmCeNM7ARg2A=;
        b=adEt66YrtSMBv07+vaDFrc20YRdIXCQAY388JyuoIQr82YCToiFahLM1UgG9DtHPcP
         /vuAk1s3VeAVEdPYcPgjHfIbwrF2H/DVuAiRqVnAzgM41w5nHVwqfXanZ8w5QZUgao3r
         rssafrjtwVSStE+ihuLsq1jrhvLNn6u6N+UIlOtWj7Llt9LzdmayTbykEYTT3XD8zj6Z
         6W6DKJZg9q6eGcPgDj+abD28oSTT1T7gZnBpwHgT7dHnjxBaNzBWZF/sZmZhEWNQr2K8
         9fWLf5OYA7ESVlAW6Tys2afxklKm8NUsdXlUR3OsryW7zaahmZslLewCPv9uEpsVDJE0
         1wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774491174; x=1775095974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8LZz/ifoYRb/n1L6k1t1xrO6vM8B/9SjmCeNM7ARg2A=;
        b=sLblPo9pny+4Z6m0QQs4yC0yUv/43kSlYe1NoJjkLLRz66eBnB43qnzyDPlOi6feWy
         7yxJJODEJE/4ShXM3umwwcVABJ0HAphEK7ntEdWVEdmbXq9nzr3ODHKCajhm1gM/Wh1Z
         AFGjCl7M9Adn39k/slh6R4w570xrX6JcHWGUSreclMtjzawY/FRB73+X3tYyUmHBJZfe
         zyraa3QKItZ0YquD4BFG0410mWaVYaeppUBbaEnJWmaXfZdnkB9PPhJZ+++4fDnquvcn
         otTLxspnUyzkpMbbU0dRPwkYqEkFw9A3wvQVuf+ukO6NUBjPpYua1YZCCdRMVdVJjtBS
         8fuA==
X-Forwarded-Encrypted: i=1; AJvYcCXADo+xkSGGy6/xmudwuDT2FVyJtR12acGq6r8g3K+U5u7UMSfzOE55W62hNxeF+2NC9nAGnLPpaOs+/mP9tEviIzsj@vger.kernel.org
X-Gm-Message-State: AOJu0YwsAiOigdUrocyA5aBXTYtxWBL4fU4UnDi4j80mhR8BrYo3znmJ
	WtyGcFNO4Uf8i+QWbAuSEkcGD20smrUvS3+zYIvNxLqzGfM9kQDCwTjhMxDrw4Z1EKtIs11WGXA
	xREdZ0i5ZaRtCFNx63SOlJkir9keEjZo=
X-Gm-Gg: ATEYQzyrMUElrVczLtu4McT/Ce8x2QSQaGwh+OMcfVlKO5qmFpqEbTekxHWUvptzKS7
	tFGoHbhTTRHZMBWXXjOU0eK/xmmmSGPKB2PyRbaxvh3R4rh3TE6jVGzwFkvZ1MkdKOROb/+0dwS
	Xka7rcwM2h+nfxIJ2WHTKEjJiB/4MyXw6Oh/MNxvm2ROsj/zCXMH0mZd72YVSeD6rqX0MRmbPqR
	//3rQIpntt7qgK+on3c6na+waHB2cyb/Qy5mccIGmk71UcwFdn9nA3yZlCrtIyo4EZPvHe3y8h9
	MpTJLL4XvbO8Dw2Ruzs=
X-Received: by 2002:a05:6214:478c:b0:89a:8434:108c with SMTP id
 6a1803df08f44-89cc42a59d0mr75882416d6.15.1774491174273; Wed, 25 Mar 2026
 19:12:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324221032.1333636-9-derekjohn.clark@gmail.com> <202603260302.X0NjQOda-lkp@intel.com>
In-Reply-To: <202603260302.X0NjQOda-lkp@intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 25 Mar 2026 19:12:43 -0700
X-Gm-Features: AQROBzCCMauqzLcmBl2kKVUIVShU14LLDgvO9-3x4yc_nzuajvT4xQWqyoEo6mk
Message-ID: <CAFqHKT==yv=1E9Tjz+xbMZpS+33_jFYe6hCVdktmctaKiAUHZQ@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Jonathan Corbet <corbet@lwn.net>, Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 12:43=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Derek,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v7.0-rc5 next-20260324]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/plat=
form-x86-lenovo-wmi-other-Move-LWMI_FAN_DIV/20260325-070851
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20260324221032.1333636-9-derekjo=
hn.clark%40gmail.com
> patch subject: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI bat=
tery charge limiting
> config: x86_64-randconfig-005-20260325 (https://download.01.org/0day-ci/a=
rchive/20260326/202603260302.X0NjQOda-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260326/202603260302.X0NjQOda-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603260302.X0NjQOda-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld: vmlinux.o: in function `lwmi_om_fan_get_set':
> >> drivers/platform/x86/lenovo/wmi-other.c:206:(.text+0x1b74542): undefin=
ed reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `lwmi_attr_01_is_supported':
>    drivers/platform/x86/lenovo/wmi-other.c:1267:(.text+0x1b74fdf): undefi=
ned reference to `lwmi_attr_id'
> >> ld: drivers/platform/x86/lenovo/wmi-other.c:1270:(.text+0x1b75013): un=
defined reference to `lwmi_cd01_get_data'
> >> ld: drivers/platform/x86/lenovo/wmi-other.c:1283:(.text+0x1b7515b): un=
defined reference to `lwmi_attr_id'
>    ld: drivers/platform/x86/lenovo/wmi-other.c:1299:(.text+0x1b752f4): un=
defined reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `lwmi_om_fan_info_collect_cd_fan':
> >> drivers/platform/x86/lenovo/wmi-other.c:565:(.text+0x1b75ca3): undefin=
ed reference to `lwmi_cd_fan_get_data'
>    ld: vmlinux.o: in function `lwmi_psy_prop_is_writeable':
>    drivers/platform/x86/lenovo/wmi-other.c:687:(.text+0x1b75e2f): undefin=
ed reference to `lwmi_attr_id'
> >> ld: drivers/platform/x86/lenovo/wmi-other.c:690:(.text+0x1b75e5a): und=
efined reference to `lwmi_cd00_get_data'
>    ld: vmlinux.o: in function `lwmi_psy_ext_set_prop':
>    drivers/platform/x86/lenovo/wmi-other.c:649:(.text+0x1b75f9b): undefin=
ed reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `lwmi_psy_ext_get_prop':
>    drivers/platform/x86/lenovo/wmi-other.c:603:(.text+0x1b761aa): undefin=
ed reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `lwmi_other_probe':
> >> drivers/platform/x86/lenovo/wmi-other.c:1612:(.text+0x1b764eb): undefi=
ned reference to `lwmi_cd_match_add_all'
>    ld: vmlinux.o: in function `lwmi_om_fan_info_collect_cd00':
>    drivers/platform/x86/lenovo/wmi-other.c:540:(.text+0x1b7680f): undefin=
ed reference to `lwmi_attr_id'
>    ld: drivers/platform/x86/lenovo/wmi-other.c:540:(.text+0x1b76838): und=
efined reference to `lwmi_cd00_get_data'
>    ld: vmlinux.o: in function `lwmi_om_ps_ext_init':
> >> drivers/platform/x86/lenovo/wmi-other.c:806:(.text+0x1b76a57): undefin=
ed reference to `devm_battery_hook_register'
>    ld: vmlinux.o: in function `lwmi_om_fw_attr_add':
> >> drivers/platform/x86/lenovo/wmi-other.c:1474:(.text+0x1b76afa): undefi=
ned reference to `firmware_attributes_class'
>    ld: vmlinux.o: in function `attr_current_value_show':
>    drivers/platform/x86/lenovo/wmi-other.c:1225:(.text+0x1b77015): undefi=
ned reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `attr_current_value_store':
>    drivers/platform/x86/lenovo/wmi-other.c:1165:(.text+0x1b776e2): undefi=
ned reference to `lwmi_attr_id'
>    ld: drivers/platform/x86/lenovo/wmi-other.c:1168:(.text+0x1b7771c): un=
defined reference to `lwmi_cd01_get_data'
>    ld: drivers/platform/x86/lenovo/wmi-other.c:1179:(.text+0x1b7781e): un=
defined reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `attr_capdata01_show':
>    drivers/platform/x86/lenovo/wmi-other.c:1099:(.text+0x1b77e38): undefi=
ned reference to `lwmi_attr_id'
>    ld: drivers/platform/x86/lenovo/wmi-other.c:1102:(.text+0x1b77e67): un=
defined reference to `lwmi_cd01_get_data'
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for LENOVO_WMI_TUNING
>    Depends on [m]: X86_PLATFORM_DEVICES [=3Dy] && ACPI_WMI [=3Dy] && ACPI=
_BATTERY [=3Dm]
>    Selected by [y]:
>    - LENOVO_WMI_GAMEZONE [=3Dy] && X86_PLATFORM_DEVICES [=3Dy] && ACPI_WM=
I [=3Dy] && DMI [=3Dy]
>
>
> vim +206 drivers/platform/x86/lenovo/wmi-other.c
>
> 51ed34282f63fa Rong Zhang 2026-01-21  186
> 51ed34282f63fa Rong Zhang 2026-01-21  187  /**
> 51ed34282f63fa Rong Zhang 2026-01-21  188   * lwmi_om_fan_get_set() - Get=
 or set fan RPM value of specified fan
> 51ed34282f63fa Rong Zhang 2026-01-21  189   * @priv: Driver private data =
structure
> 51ed34282f63fa Rong Zhang 2026-01-21  190   * @channel: Fan channel index=
 (0-based)
> 51ed34282f63fa Rong Zhang 2026-01-21  191   * @val: Pointer to value (inp=
ut for set, output for get)
> 51ed34282f63fa Rong Zhang 2026-01-21  192   * @set: True to set value, fa=
lse to get value
> 51ed34282f63fa Rong Zhang 2026-01-21  193   *
> 51ed34282f63fa Rong Zhang 2026-01-21  194   * Communicates with WMI inter=
face to either retrieve current fan RPM
> 51ed34282f63fa Rong Zhang 2026-01-21  195   * or set target fan RPM.
> 51ed34282f63fa Rong Zhang 2026-01-21  196   *
> 51ed34282f63fa Rong Zhang 2026-01-21  197   * Return: 0 on success, or an=
 error code.
> 51ed34282f63fa Rong Zhang 2026-01-21  198   */
> 51ed34282f63fa Rong Zhang 2026-01-21  199  static int lwmi_om_fan_get_set=
(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
> 51ed34282f63fa Rong Zhang 2026-01-21  200  {
> 51ed34282f63fa Rong Zhang 2026-01-21  201       struct wmi_method_args_32=
 args;
> 51ed34282f63fa Rong Zhang 2026-01-21  202       u32 method_id, retval;
> 51ed34282f63fa Rong Zhang 2026-01-21  203       int err;
> 51ed34282f63fa Rong Zhang 2026-01-21  204
> 51ed34282f63fa Rong Zhang 2026-01-21  205       method_id =3D set ? LWMI_=
FEATURE_VALUE_SET : LWMI_FEATURE_VALUE_GET;
> 51ed34282f63fa Rong Zhang 2026-01-21 @206       args.arg0 =3D LWMI_ATTR_I=
D_FAN_RPM(channel);
> 51ed34282f63fa Rong Zhang 2026-01-21  207       args.arg1 =3D set ? *val =
: 0;
> 51ed34282f63fa Rong Zhang 2026-01-21  208
> 51ed34282f63fa Rong Zhang 2026-01-21  209       err =3D lwmi_dev_evaluate=
_int(priv->wdev, 0x0, method_id,
> 51ed34282f63fa Rong Zhang 2026-01-21  210                                =
   (unsigned char *)&args, sizeof(args), &retval);
> 51ed34282f63fa Rong Zhang 2026-01-21  211       if (err)
> 51ed34282f63fa Rong Zhang 2026-01-21  212               return err;
> 51ed34282f63fa Rong Zhang 2026-01-21  213
> 51ed34282f63fa Rong Zhang 2026-01-21  214       if (!set) {
> 51ed34282f63fa Rong Zhang 2026-01-21  215               *val =3D retval;
> 51ed34282f63fa Rong Zhang 2026-01-21  216               return 0;
> 51ed34282f63fa Rong Zhang 2026-01-21  217       }
> 51ed34282f63fa Rong Zhang 2026-01-21  218
> 51ed34282f63fa Rong Zhang 2026-01-21  219       /*
> 51ed34282f63fa Rong Zhang 2026-01-21  220        * It seems that 0 means =
"no error" and 1 means "done". Apparently
> 51ed34282f63fa Rong Zhang 2026-01-21  221        * different firmware tea=
ms have different thoughts on indicating
> 51ed34282f63fa Rong Zhang 2026-01-21  222        * success, so we accepts=
 both.
> 51ed34282f63fa Rong Zhang 2026-01-21  223        */
> 51ed34282f63fa Rong Zhang 2026-01-21  224       return (retval =3D=3D 0 |=
| retval =3D=3D 1) ? 0 : -EIO;
> 51ed34282f63fa Rong Zhang 2026-01-21  225  }
> 51ed34282f63fa Rong Zhang 2026-01-21  226
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Can someone explain to me why this is happening? I cannot reproduce
these locally with W=3D1 and/or C=3D1. I'd prefer to resolve this before
submitting a v6.

Thanks,
Derek
