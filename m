Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3384BB27F
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789497400; cv=pass; b=rVTaDwhXTOOVppdF0yeQAHEXMfTNmVHu2QDkR3KJ9YKh1BLD0wkCmyuMKbltEo9Gt7uPxGp7PmFiobeaxHgT0jA759xRkgZaJSlWI9VGrPNDnbLKwaeZ15nd1LxT+RDfEaQ8uIOWLDgimb4S4/mEoQ8NSMWyPHcPj/jnL1K2DQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789497400; c=relaxed/simple;
	bh=0fAJ96KToGBaJVYivQxfXHrnlsaMATy4LRpTL6ELZ7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfXja001tglkTfNuyFmAl75hsFkKbGy3LUIyLgxSVQ/PYocHqiQP6Gy+cHa/SJ21o0gFjq/oXhE6VY6ynf8n3b44Wj1Jd7cQDzmukTpqHaNagJmp2KcXhxuvNjzzUPKLx5t1yy0Ugv4jNfUQCh0j81H/DdSjbF6kw0GpmfQqJBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imblA3iD; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imblA3iD"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c169ae1cb26so140786366b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 11:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789497393; cv=none;
        d=google.com; s=arc-20260327;
        b=L5M+kD+kmR16wv7riBRMPEIMaIVAKityMHPMTG34MgP1LZkq8CfP6MaZAoUKvau0Da
         G+OwFuF2kHO8+Ja7Z5wEgnvUZ7QJGUc9sd8FuB0F4tcg49BeLUnrUEquhWEvI5r9wiyN
         EZrD6yWEisbQ1S2JcMkdRGydcq9rphz2mHu5HBvlV3ySoKBan9rQT1lK4dM3+SVR8NMg
         Ep5Fp4/7oXpeLvSYBw2NoVz1X2nG2EAI/uEJ5sTTU/97e0B0G3K+Xxpi/vLQUD+Vzszr
         wm/aN5o6uMpLkc/Pm0seq9TMdg6GE7PoGv4JFL7wTjFR9XWjwJ13MfpYi5S/GF3ksqco
         JYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gIXlRpFwzAqF+gXj9N4lNHJj37A+1bZjmxnWxX0j5Uc=;
        fh=5L7D52bOsE513Uv8F7rOc8soiR7Np9hzdQN3oEUU6sU=;
        b=qxQkgHIrtdQVvat49TfXhMUUiMKO+BSixYBlZ/6M+B9txXfbP3kW/LoIzai6A487Y6
         PkXfuP/tIIRD6kGWnJwFaIAAedUgsNEBqrTahYEQkGSkcQbNNiZ7QM81n2zBHzvGGZab
         5wH7YgIgdfncY6W4+RrQ4ZL/WJaM7DIgfGRhWDOiPBPYxWrQTeWDgMPlziJEPCBvbe7m
         rAFDth+hbb0JGyH0oqjNHbk1eIbtD737nLdoCvpCmDBaaPkwP+c21YW/H88Aou5Vj796
         cJ0cG+v/lVBLKZyOatPUI43p4QOMMJLAtxODGe9rmrTlDiMWbo/bvkvoOWWylduSj2Tn
         IKEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789497393; x=1790102193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gIXlRpFwzAqF+gXj9N4lNHJj37A+1bZjmxnWxX0j5Uc=;
        b=imblA3iDClAKSsVa2bgWVIUxEPPlq3RSc9OuP5ZY7CURKGVC/HGgz3MIldEi/rr4YN
         ZUm+jBo5nbanqCuCwKJnTGfGlhqlcLBBZQkRP0828Mfe8KSMEHe6cIjHDP6MXL2+qr2J
         Q8luU/6AvQ17yIa5idPBk775lNVjxzCWgrj5y8KXKM3o/avD+W9CkpacPSpFwNROOZga
         FHF1rzCWwEpU2EAplRJXu073Zm6sxKuIlVaG/+7zzrx3B2Hqo8FxFnRTULzWdQwb41SJ
         6VVru0zdOjUJStmjcZQzpXsxMA85i0oke/Z0PTFq1J7qOTxUqB8Tuf7iFVeVCWE1OB+t
         FxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789497393; x=1790102193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIXlRpFwzAqF+gXj9N4lNHJj37A+1bZjmxnWxX0j5Uc=;
        b=fAGuxF+h6tpcIltr3LvRAHg0HtEYjhFR2ae4RkvMMLIwL3/GonM+1M8HnhLZ7m8vNB
         J2ZQYP9X2rsT1rNX9zHzwMpKcJ2mS2oeRbJTvpSGpKZhnLrJQPbVOkTmdW/TgU1382bj
         Zofnkqty2RtCTrvbF1nDaVke8cvf9kIybmFUSl32fZNmZBzDyyNh5JSWASyd611/0TN2
         coust2K92HvN8xDM6KyHXRV+R4WqJTnZBR9ZGgI0zGiybf6ifIC1/suI1vllefh7uDiz
         dKjGWnNeufHX/wmuk6Z/hzEnU5tSVmfHWaw2n5rRPIicriayZs32Zrnje1tr30WIxOSH
         NeUA==
X-Gm-Message-State: AFuF++mSeLm7oCAirc7dVMIuFj8cT5iK+/LJY667nu4di5GaZsrVehiR
	qFL/MMjes+AIMLP5Gq776W1Bgt52ifOcBK6Xtw1Q8qP6aocUvMnZFNcOHK9me6IXooqrSHPCeZi
	7fRLr4SuUP5wVTLobp2Wah1b9T8mWs5E=
X-Gm-Gg: AYBFou25zc4DIkG7Nckrn99zHlwonkV6vUMYkOxsEBp7og2Qt2dPtbdfKqKVuFfCzdp
	WuQKxYU7o2PR6xTfX9A5HIt3SLSRzHIrWur3QnzHSYoagTz7QpoJyks33OepzIMheax3h+qX1Sn
	gr1e2YpGFNSXR78JKLkBOISIIzoXeiJrT9Zmo1bKO5vFZfL7cZxQD69gJaIbWDzuLm/2jTWfTDu
	ZAafx8ePKp04PFYZWgNAl7ND7TXJvUwxWJW816o876mP9CbIwecZ1Skk9GuvLd42OKN2+L93MEg
	qHZ7sfACzQimk5DSrc+AK/7Ufl3bWVuBT38OgJF+oVymJZkXZIDmnIny9eBhvOP2yvFOHgleuF6
	SOa3r4m1E43NhDRXlgvXi4IEb7Zg+jzz+NI0A5B+A
X-Received: by 2002:a17:907:c0f:b0:c25:f7dc:2d3 with SMTP id
 a640c23a62f3a-c29c8b917c2mr383788566b.20.1789497393092; Tue, 15 Sep 2026
 11:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826103012.240453-1-meatuni001@gmail.com>
In-Reply-To: <20260826103012.240453-1-meatuni001@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 15 Sep 2026 23:36:20 +0500
X-Gm-Features: AcwNN1WcJfuWtzktYvt8Aa0_L2cgMeEC3hDziX2ljeuoLSbyMQO8ELH7LkNEO_U
Message-ID: <CADqcGBnQMBwAHLfeg_1Jvr5A_w5D-MmNJpCBHVMisiBp7mqfNA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: fix heap OOB read and memory
 corruption in hp_wmi_perform_query()
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping.

On Wed, Aug 26, 2026 at 3:30=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.co=
m> wrote:
>
> hp_wmi_perform_query() evaluates an ACPI WMI method and expects a
> struct bios_return header in the returned buffer. However, it only
> checks that the ACPI object type is ACPI_TYPE_BUFFER without verifying
> that obj->buffer.length is at least sizeof(*bios_return) (8 bytes).
>
> If the firmware or ACPI method returns a buffer shorter than 8 bytes:
>
> 1. bios_return->return_code at offset 4 reads out of bounds from the
>    allocated ACPI buffer slab.
>
> 2. If return_code evaluates to 0 and outsize is non-zero,
>    (int)(obj->buffer.length - sizeof(*bios_return)) evaluates to a
>    negative integer (e.g. -8 for a 0-length buffer). actual_outsize is
>    set to this negative value and passed to memcpy(buffer, ...,
>    actual_outsize), where the signed negative value is cast to
>    size_t (e.g. 0xfffffffffffffff8), attempting to copy ~18 Exabytes
>    and triggering an immediate kernel crash. Additionally,
>    memset(buffer + actual_outsize, ...) performs an out-of-bounds
>    write before buffer.
>
> Fix this by ensuring obj->buffer.length is at least sizeof(*bios_return)
> before accessing the return code, and compute actual_outsize safely
> using min_t(u32, ...), which is sound specifically because the guard
> above already rules out obj->buffer.length being smaller than
> sizeof(*bios_return) by the time that subtraction runs.
>
> Fixes: c3021ea1beee ("hp-wmi: allow setting input and output buffer sizes=
 separately")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---
> v2: Rebased onto current platform-drivers-x86.git 'fixes' (confirmed
>     matching current mainline, blob b2773fc1aca414792b99406315496a2c3a64d=
d06).
>     v1 was diffed against a stale local copy of hp-wmi.c that predated
>     a batch of unrelated upstream changes (GPU MUX switch support, new
>     OMEN/Victus board IDs), so its hunks no longer applied. The fix
>     itself is unchanged, only the base and line numbers moved. Also
>     correcting the recipient list: Hans de Goede's address is
>     hdegoede@redhat.com, not hansg@kernel.org as v1 had it.
>
>  drivers/platform/x86/hp/hp-wmi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-wmi.c
> index b2773fc..d7ad206 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -691,8 +691,9 @@ static int hp_wmi_perform_query(int query, enum hp_wm=
i_command command,
>                 goto out_free;
>         }
>
> -       if (obj->type !=3D ACPI_TYPE_BUFFER) {
> -               pr_warn("query 0x%x returned an invalid object 0x%x\n", q=
uery, ret);
> +       if (obj->type !=3D ACPI_TYPE_BUFFER ||
> +           obj->buffer.length < sizeof(*bios_return)) {
> +               pr_warn("query 0x%x returned wrong type or too small buff=
er\n", query);
>                 ret =3D -EINVAL;
>                 goto out_free;
>         }
> @@ -711,7 +712,7 @@ static int hp_wmi_perform_query(int query, enum hp_wm=
i_command command,
>         if (!outsize)
>                 goto out_free;
>
> -       actual_outsize =3D min(outsize, (int)(obj->buffer.length - sizeof=
(*bios_return)));
> +       actual_outsize =3D min_t(u32, outsize, obj->buffer.length - sizeo=
f(*bios_return));
>         memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual=
_outsize);
>         memset(buffer + actual_outsize, 0, outsize - actual_outsize);
>
> --
> 2.55.0
>
