Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794238465;
	b=CJr/rqY3OlWKZSsGMV+COmZrBuZPD0/Sbcmbmk3pcbC20gYTz/ZoQUw2RbiaJj4ERFFw
	 d1e7b7f10tmxpHcxysmDBuI+i3+Ir9u6XnkIOLI1cHsAsI9oP+j5zkGfab2OoE9YI+nrH
	 rtKjDjxgvHdnfMkjsqtB/B+Q0y6SZVTZ9Z0Qh3kj0bWJSj5jM5qHUUp2ibhFCbZOBlqgg
	 yKtGg1w6R/prxM+XTgmOgUmYXY9PqJbs8lNB73x6wvVTIuxo0xybf/F1J5IatOJ1EaSCw
	 crk6MWkbqnoDGkzHnIq/TbRsblmGITPGRDq/V9SKWx03ekQZzdfEJ66rvQNVLushI/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=WVukrYsPbFF473s2K9zf2mkSZNUUvvxXMXskigLhwhY=;
	b=N86I1j4HoqxS10SgCjklB/Z0jbfPwZTuVA4FD7GEi7oJOfeG06bcva/Z376CO+jZ8zE7
	 PpIqQ5thOihRrAHdr5jLPJKDmxuAH1e513u+Nq09kcWfIBwiaJbTsywJYGlhA7+rHV07m
	 YGn5qflRV7XZnFpUljCBckT7F+lUiQYfkLfBE1zIGcmuWJxolNccNgI+R/50DA2Xi5xVq
	 6XwMKlnQ/yIqMT7RTdO7NqoeQzUOwSjOjhxaWI+GFEj3/rogszGLyPVS4/XqAFTLu7FmK
	 5ElkJ0MQ6zu3tr6DTtTRVZGGbiBr/jJ97FUQINdWnF0AbTuy2Et62rh5LyB4LNuQeVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yikXqh2p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87669606A321
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 15:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87669606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yikXqh2p
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so675871c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 07:34:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794238465; cv=none;
        d=google.com; s=arc-20260327;
        b=WnY1QwIryIaQFxWc8aco7L5uZH4DPODNKLA4NMbe39MCEBUxKwAI7ZMmhGLPh6ZijS
         gjYHaKutq5cR6sE/2o+9r1UaND+ADWFBP0hywAiFsdXBy5zePbxmiV8PAOKly4W+OMzn
         zEnZcVprHn0sNj1B2I9V87tdPXI0t0d520ZxvzMRvmrFSvmIfyYSg6raml8mZLXY+bN5
         m5B2fiJYtw2ZiZ14O/rLYCBkRnN6nbtQsPEteo/YIR1z7nafZfyi09vwWWfk+R2iuOoK
         Mby1SNxCO5doqD9XSqVrwBEKoJeMib6AJHByCmfjO+e6hEmouyjQyK25aRIDz47Nrr6L
         WI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WVukrYsPbFF473s2K9zf2mkSZNUUvvxXMXskigLhwhY=;
        fh=ZvRsMGnHv2E52FTeXGVKFRisfTAqdDSCoN3Lcymq7oU=;
        b=NHkUi0K0WJ/6nraXLBqqDXHqqnnLXOp96OExV0lD+5LeDk0xBSlG7M/8qHhHlTx9FQ
         9KcGvfFUy5uBWDO8APSU8R87uNJSjnzdkZO1jYu6dPIUk8QYxraQsPDENym7xV/R3YW7
         0huFfNipfepr0kzYfB+fvSzlU4Jh39Q7ar3Wqmo1g4CWMaVRX5kkTv7glaNyZoNkSEBa
         Z2jbqmkSiLo6IfAV1ZJjUDNWiNeydML9K6dN0mmuuxvFrHki/9E9a4AF49Mx8YcAlakk
         FOuwLtLagdTHhm1ru/rCMy1Hmqiwq06uJ7pRMViQXFA493Ommvxo1mcH2h5FzVGskLVF
         slAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238465; x=1794843265; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVukrYsPbFF473s2K9zf2mkSZNUUvvxXMXskigLhwhY=;
        b=yikXqh2phUIyvWpxB/H+q/1PVpKEZ/DNzQnpe8b0xI/tdJdVYp2ggI+b9bz0Lvje+A
         xq/C6uYvJxliao7YP3t58ndm78b9osxrUCh/lIOTuAcOkttWmoNIZNAfbvO83rZBoqw5
         uxrsWg8J5QK9wL356LHQynLSF3DAtVTzN2TbKjd70G44ENYfJUlZRfdr38Tl9IQ0XhQo
         9Swa07oJGd9OqSK6KqIeHTKIW5ADbSKt5/glANh7d/xk3dOIftK+BCwiByTsrBwKCPL7
         2KhDSTpUvbobLdSbyVtYj42pFi4PrQzcvIV3rZcK8dXeQk3ixCNQHfJK1I7YGiq3Z+8p
         9v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238465; x=1794843265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVukrYsPbFF473s2K9zf2mkSZNUUvvxXMXskigLhwhY=;
        b=rNRKrZzf89qsXMUUSidn5ycK9zHuZ8chWklAMZVfuBXOtGqyEub8V22hMsqeogkNeL
         sr3sr64dIFXbh+Fae/DW/w/2+09xmHFpDmAEEpK3mh2aCtQXhEeuOFQEYm1NGBqKzp1d
         P+o7cYhUTiDXIdxJPKrOhFo5lzLiY96YmwQzNzWrdscxC+Sh9lQYgLkxA2s8VMO/t9sw
         3IELZYOxzg3trvQhRuALiw2qAMcACEQuDzECuh3qqPV+0e+2lxpRsjrXl7nZE2swYhc9
         U5m42IXo/D68ICralqgPYiStnDzZyLa6ovsgMNLOqG+GZAJ1YqOzmbho73zhJJXd78ln
         TX3g==
X-Gm-Message-State: APuU4Z+ii1D92SKdhcnqw4+hir3MKqmhkkfTxUPJ4RSnz4QE7jfSQEtf
	MOdcxlmLIaQhMO9STsxgfSuKwoVDZ9sCIEkw6VklKd5PJ/7BTXuKCjr0PfGEvEaJM9IRz5z5XB4
	I+IuQqRRD0bOAG0tZ7k/QXjVrcVdgLR8=
X-Gm-Gg: AYBFou0/w2YbawsdoyRYrXNoqPqV/2tkQ4S1EN4TCVzUFzNdjO3lJWoduaSohqBHfGt
	MNC4aQdnI3Tvbmau/u57PWm8yFg4KqOEgUm63ieTmZsAUOTAerIime8zKxO1a2tTzqo4VT+IQkK
	rXNTsI+Em3KZMNICWEwRJG5NirdQBJHq9cw2oZcjCNcUnYUj0y3DuE5PIvT2B9jzkU7lFsWGfFQ
	927ZbYyrxEFSwWNg5lC+39D87M6tXzQ7aK1OLVtD9Hlu3p2nvRAj/3KD672nAl5JJ1Hp8QLgmzh
	SD4PXA16imSRQihyxyxng19r3MXp6KpUpTIHiMvw8DLaIlGbdrvGgK7ykuYHLrHRICs7WagFKdO
	8Uo56989mkXUUvEk6UN7wl9j67Hd3+3yLF9COuQ==
X-Received: by 2002:a05:7022:4388:b0:1ae:e0f5:2cdd with SMTP id
 a92af1059eb24-1b39feaebacmr8289891c88.28.1794238464457; Mon, 09 Nov 2026
 07:34:24 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
 <f718e7cd-24f1-428b-b9f7-28bb1a923a11@gmail.com> <CA+Kibh6T9tPKwhSF2X5Jwoo8OUoieypuAyM4GBKVujUDWgpr-g@mail.gmail.com>
 <08e0f238-4330-418b-ae3b-fa7ce0f6ef62@gmail.com>
In-Reply-To: <08e0f238-4330-418b-ae3b-fa7ce0f6ef62@gmail.com>
From: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
Date: Mon, 9 Nov 2026 18:34:11 +0300
X-Gm-Features: AclHuK-BoccA8Cm9Huf8OBdFW57iTUEi1LolooeDp5MbFnpce5HgXJGPyHYeVk8
Message-ID: <CA+Kibh5hpfyLHFb=z=rPjCOsRp=a_9eVpj6HF9E9rXx3oHg7oQ@mail.gmail.com>
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Mingyou Chen <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	regressions@leemhuis.info, regressions@lists.linux.dev, shlyapugin@gmail.com
Content-Type: multipart/mixed; boundary="000000000000516e31065fd9b2da"

--000000000000516e31065fd9b2da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 2:28=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> w=
rote:
> Hi,
>
> Here's your quirk (inside the email attachments).
>
> Please apply it on top of my patch series in this email:
> https://lore.kernel.org/r/20261028112742.674847-1-qby140326@gmail.com

Tested your quirk on top of v15, built out-of-tree against 7.2.15.

Three problems:

1. The DMI entry does not match here:
DMI_SYS_VENDOR   =3D "XIAOMI"
DMI_BOARD_NAME   =3D "TM2209"
DMI_PRODUCT_NAME =3D "Redmi Book Pro 15 2023"
TM2209 is the board name, not the product name. As sent, the driver
falls back to default_quirks - four entries in
platform_profile_choices instead of three.

2. .return_code_at_end =3D true is needed. A WMI_FN_SYSTEM_PER_MODE call re=
turns:

00000000: 00 08 02 00 00 00 00 00 00 00 00 00 00 00 00 00
00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80

function echo 0x0800 at offset 0, mode value at offset 2,
0x8000 at offsets 30..31. Head-first parsing reads the function
echo as the return code, so every call ends in -EIO and
profile_get always fails.

3. .skip_ac_type_check =3D true is needed; USB-C only board, AC type is
never CIRCULARHOLE.

Your profile values are correct - Fn+K emits hotkey events whose
value_low cycles 1 -> 3 -> 2.

Corrected quirk attached. With it, from a clean boot all
three profiles set and stay set through power-profiles-daemon, no
reverts and no -EOPNOTSUPP.

Two further observations.

Fn+K emits WMI_EVENT_PERFORMANCE_PLAN_ALT (22), not
WMI_EVENT_PERFORMANCE_PLAN (15); only the latter is handled, so
platform_profile_notify() is never called here. value_low carries
the resulting mode. Possibly relevant to the question in your v15
cover letter.

The platform profile does not affect the power budget. Writes are
accepted and read back, but package power does not change.
stress -c 16 at both ends of the Fn+K range:

Fn+K high low-power 4391 balanced 4348 performance 4217 MHz
Fn+K low low-power 1726 balanced 1825 performance 1953 MHz

Varying the order of the profiles gave no consistent effect. The same
sweep with --block-driver=3Dplatform_profile, amd_pstate only, gives
1464 / 3550 / 3519, so the drop under power-saver comes from
amd_pstate.

Correction to my first mail: ~35 W is not one of the three Fn+K
steps, it is the EC power-on state. The steps are 15 W, 54-60 W
and 54-65 W; the first Fn+K press leaves the power-on state and it
does not return until the next boot.

--000000000000516e31065fd9b2da
Content-Type: text/x-patch; charset="US-ASCII"; name="TM2209-quirk-fixed.patch"
Content-Disposition: attachment; filename="TM2209-quirk-fixed.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mw9f5r7t0>
X-Attachment-Id: f_mw9f5r7t0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYyBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYwppbmRleCBhNDMxZDNmZWYuLmM2
ODAxMDdjMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYml0bGFuZC1taWZzLXdt
aS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYwpAQCAtMTEz
LDcgKzExMywyNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJpdGxhbmRfbWlmc19xdWlya3MgZGVm
YXVsdF9xdWlya3MgPSB7CiAJLm51bV9wcm9maWxlX2VudHJpZXMgPSBBUlJBWV9TSVpFKGRlZmF1
bHRfcHJvZmlsZV9lbnRyaWVzKSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYml0bGFuZF9w
cm9maWxlX2VudHJ5IHRtMjIwOV9wcm9maWxlX2VudHJpZXNbXSA9IHsKKwl7IFBMQVRGT1JNX1BS
T0ZJTEVfTE9XX1BPV0VSLCAgIDIgfSwKKwl7IFBMQVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQsICAg
IDEgfSwKKwl7IFBMQVRGT1JNX1BST0ZJTEVfUEVSRk9STUFOQ0UsIDMgfSwKK307CisKK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgYml0bGFuZF9taWZzX3F1aXJrcyB0bTIyMDlfcXVpcmtzID0geworCS5w
cm9maWxlX2VudHJpZXMgPSB0bTIyMDlfcHJvZmlsZV9lbnRyaWVzLAorCS5udW1fcHJvZmlsZV9l
bnRyaWVzID0gQVJSQVlfU0laRSh0bTIyMDlfcHJvZmlsZV9lbnRyaWVzKSwKKwkucmV0dXJuX2Nv
ZGVfYXRfZW5kID0gdHJ1ZSwKKwkuc2tpcF9hY190eXBlX2NoZWNrID0gdHJ1ZSwKK307CisKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBiaXRsYW5kX21pZnNfZG1pX3RhYmxlW10g
PSB7CisJeworCQkubWF0Y2hlcyA9IHsKKwkJCURNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRP
UiwgIlhJQU9NSSIpLAorCQkJRE1JX0VYQUNUX01BVENIKERNSV9CT0FSRF9OQU1FLCAiVE0yMjA5
IiksCisJCX0sCisJCS5kcml2ZXJfZGF0YSA9ICh2b2lkKikmdG0yMjA5X3F1aXJrcywKKwl9LAog
CXt9CiB9OwogCg==
--000000000000516e31065fd9b2da--
