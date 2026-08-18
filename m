Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F5636212E
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080607; cv=pass; b=rD8bzWjha44fMPxWl/+2UtATxoqqvOFdvWtbYBsJEndmKl5Q6pTGTvq9N1MydAjvvjMlTViqbU62LxAu2MSch34oKOQ04Tv1WCzEZvEZFsqqC9cYSyDRGA5gF5TAU+mcKy0pwFf8fU7lQhZvDU4Qqq71nKRsH78JgIyB8fsMWFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080607; c=relaxed/simple;
	bh=jnUs4jwUuhP2XNi5yuvx6HOb3PmM28YCMYg+bxW2YwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJnZosOYzFSGLwS5S+bb7uqcs7hlXWcq43VPI3ruzw8vmrvW9ssHg5oAsk4MuEz796cD6JR8UkEX6G4qGQ5N5kLUk0ZWc0ws/6wWZkI8aT+1YXCS/GAbwIj9em8vPfkR8+XCw9nhPC3ZGH0abad5j8YO5kDBdlivDOWKlwGbpYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYmEbS5S; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYmEbS5S"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c20ce3c118aso27188466b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 12:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787080601; cv=none;
        d=google.com; s=arc-20260327;
        b=r4zrW9fgU8Wp3L4gLnRmB3bOtBnNwWheKFm8miFBnuIQY+FzWI4zFDiVsHnq2rJ5NF
         9PZ1ZS2p0nte9GUMj3jzQV2sphsa58eo1WOSlJ8iYDaSD8Q0VLqTPEL91ZIEE0euagm1
         jMoFp9lvpwO3V8irT8JyPRZ199uwaOiDveeA5toshf6VfoRpJy5XJDJSiJE9Zi+Vum3f
         ajYEnH4gnT/U4qaGXZe10X5QHlZiDxlsoUiH8MwDDf2CbtuEnbSBoKVK8NEmSs7xEyza
         Rv8504QX1h9P5Uxt0c2H5PP1UXos4gW0Ux236fmc8yEVqboozfn6t4ZWdY9AcBnMkv+4
         6smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6F63kr4+87sB4ghmMaGvMuNwmiTbtkXM8okV9uIZ1I=;
        fh=lXjYBd+6+wLfqZeQUMnYHxhspxQW4nZcoWFS1lF2arw=;
        b=a0yY7eACk7Q6Cfqk6x2U7HKBdENb94FbQCr8Rv6XzRRwCE39KrKxtQ3+wVtAqy4Zfz
         b2ECoBKYWQ0P/RC2jVo5MTFrPjW8KsVaXge8nRe7swE+oNN1ljQdKX0ARamzk5qNf7Jd
         YMJBB9ilAr2JGlMjsqsDp2o2ZXwwCbrX/P07ey6hCgOLgdJl//RvyO4+ylORscWsAFC6
         iRGtKHZ3r/dKGXp5y689etOgcr9Gz1GXBJGiFYwO6wRXFu9lKxCHkIbV8ixE0DGzmc7g
         JwHE6MHxDf9c5f91q1H2hPNHSRgV8LpZGFiekT8mq8o3tjEtpT446SvpOtqMA+8GB/2j
         wMxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787080601; x=1787685401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K6F63kr4+87sB4ghmMaGvMuNwmiTbtkXM8okV9uIZ1I=;
        b=NYmEbS5SasrS3hLsCZCiiduPWqbojChcPw0c40+I2PLFN3nDPmrdQBhqAyFv5AUPB+
         T3jJZoSXApRgWdhFOJWJPDoVkznG9aFMnZeZQgmuosOywvA8BMU5fNmkAl36fIIKj5oW
         TPIxi3Q0OXbNQuuIUdBoBp7DgszafsnoxbIIJPdGTz/+4tC1CFz03WEPxAy9H/dokTO8
         33aj7kfRcscH8CK6miOs8sASbbJZL8lBMwtJPi/KD4Ko/95BRamyneJxC/3aG5ogf4rh
         OlGXi+AtQXHXfJXaxUcAwW0gn3Q5elMd4lKKE3pCv/j7jjSHiaxt4k5VMCyD9LFoq8CQ
         8+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080601; x=1787685401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6F63kr4+87sB4ghmMaGvMuNwmiTbtkXM8okV9uIZ1I=;
        b=aFQ6JFV9CkLUK5wuq+zdfpv3j8HVVcUPLaSsfGIJTHDFqElF77oAR+eXeBtNTttjI4
         zAFfLYkGdbXMtXQ5xXcHrhOpmhJE71aJB8p3ijl0MG0/CzhCVQI1/FUIdjT6sN2Nq1K1
         EV1kyDf6dtJ0rVldw97n9hXV6YFZT0hbT4a2owpTjXrp7Wti5jYhNyE2D3jKX+sbq2CF
         8b9UsL04YOK0cFfEzieKf0/yAseTmFAnod5o3sVx8zO+DA1lteF2Lp7NlCN4eAIjHj09
         fToDhnFgrDjvJY0e1YRtOi59ATWZJ7Uy8HQdgcSOBYBtxnXAzlE9UkRoOqUmOSa3DxPE
         CO6Q==
X-Gm-Message-State: AOJu0Yzi4CWuSYTlnSEOIwWdqCJW1wgDi5MmyJIGZpK+rSpvWFfrxVCY
	3RExdBi5mt4uIJeh0Ap1/RqP6++YxPLdMOb5imM0aApdPhZrJYYI00gDIxT0GIfOgQdry8MXAZs
	PIl8t6jP1DOSlWfi8xyNLKHY0YAiJe9c=
X-Gm-Gg: AR+sD10j7NPv4Uy9NZX+uBC5cNyIhLxkj7N0cdhqxyDXGhDqn2wPaQXKUV97YKjeL0r
	QC7q5n9qUsT9lluWC76KjFVQzBcUUL+EuhY4iyDhtCy/z/oF0zID1cd7loyaW4s2jxe4qOv3BrN
	46QEQeSWDtvNXioYfMlSIK0g01k3z38q2nHaf3+wq8o+++PHe5JGhL/3FbjRefX0R8G5QIkuLmt
	qCMvDN5HQROh4vDoLztDNlRfwtIfJOkgWR0RlJSe0QT091IPmmSfzBoCRcG2vMssWFTkxkMAaeS
	cA4AOEVx6HBper+xpqOy4eJRL94D2friFcoi6xGfynKLE8gdfvgRqrruIX4KfE1kv2fzFitr3Be
	wjajj3krFkwENxgyZ6gfHW2w66XRG8biuK1vGCQ==
X-Received: by 2002:a17:907:d26:b0:beb:d461:7b09 with SMTP id
 a640c23a62f3a-c2229968e30mr40655666b.11.1787080600847; Tue, 18 Aug 2026
 12:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812111829.172273-1-meatuni001@gmail.com> <056903f7-802d-3db5-f0c8-b1c66d37b8c2@linux.intel.com>
In-Reply-To: <056903f7-802d-3db5-f0c8-b1c66d37b8c2@linux.intel.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Wed, 19 Aug 2026 00:16:29 +0500
X-Gm-Features: AcwNN1XEhyBjD7AyymcuQxdYUrgbM3et6h0a80EohmeOa4x5Usm8h0K4YUfdQq8
Message-ID: <CADqcGBnCt-Rkxa3ms7g-nbe2+Js9fyzSH52KQPNZBvoeTiaRcg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] platform/x86: hp-bioscfg: fix multiple memory
 safety bugs and parsing errors
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, jorge.lopez2@hp.com, 
	Hans de Goede <hansg@kernel.org>, linux@weissschuh.net, 
	LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thank you for applying patches 1-3 and 6-9 to review-ilpo-next, and thanks
for the heads-up regarding Guangshuo Li's earlier patch for the password
encodings bounds check.

I have submitted v3 for the remaining two patches (patches 4 and 5) here:
https://lore.kernel.org/r/20260818191120.38556-1-meatuni001@gmail.com

Once these remaining fixes settle, I will look into refactoring and
consolidating the duplicate ACPI element parsing logic across the
attribute files as you requested.

Thanks,
Muhammad

On Tue, Aug 18, 2026 at 5:08=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 12 Aug 2026, Muhammad Bilal wrote:
>
> > This series fixes several bugs in the hp-bioscfg driver:
> >
> > 1. Memory safety issues (patches 1-6):
> >    - Off-by-one NUL terminator write in hp_get_string_from_buffer()
> >    - Heap OOB read in sk_store()/kek_store() when passing original
> >      count instead of trimmed length to hp_wmi_perform_query()
> >    - Heap OOB read on empty password write in validate_password_input()
> >    - 16-byte heap overflow in hp_calculate_security_buffer() for empty
> >      authentication tokens
> >    - Off-by-one heap OOB write in audit_log_entries_show() when more
> >      than 256 log entries are reported
> >    - Missing bounds check in the PSWD_ENCODINGS parsing loop
> >
> > 2. Logic bugs (patches 7-8):
> >    - new_password_store() incorrectly passing is_current=3Dtrue, causin=
g
> >      writes to land in current_password instead
> >    - ORD_LIST_ELEMENTS case using a stale NULL str_value pointer
> >      instead of converting the current ACPI element directly
> >
> > 3. ACPI package element index tracking (patch 9):
> >    - Five attribute-type parsers (enum, int, string, order-list,
> >      passwd) all share the same defect: multi-element array cases
> >      consume "size" consecutive elements but the outer loop only
> >      advances by one, causing the next iteration to misread a
> >      leftover array entry as the next property and abort with -EIO
> >
> > Tested on HP EliteBook 840 G2 (BIOS M71 Ver. 01.31), kernel 7.2.0-rc5+,
> > with CONFIG_KASAN_GENERIC=3Dy and CONFIG_SLUB_DEBUG=3Dy.
> >
> > This series applies on top of:
> >   commit ea4d8f8ba283 ("platform/x86: hp-bioscfg: fix
> >   slab-out-of-bounds write in hp_convert_hexstr_to_str")
> >
> > Changes in v2:
> >   - Squash patches 9-13 from v1 into a single patch (now patch 9),
> >     as the fix is identical across all five attribute-type parsers.
> >     Requested by Ilpo J=C3=A4rvinen.
> >
> > v1: https://lore.kernel.org/all/20260803143037.93105-1-meatuni001@gmail=
.com/
> >
> > Muhammad Bilal (9):
> >   platform/x86: hp-bioscfg: fix off-by-one write in
> >     hp_get_string_from_buffer
> >   platform/x86: hp-bioscfg: fix heap OOB read in sk_store and kek_store
> >   platform/x86: hp-bioscfg: fix heap OOB read on empty password write
> >   platform/x86: hp-bioscfg: fix 16-byte heap overflow for empty auth
> >     token
> >   platform/x86: hp-bioscfg: fix off-by-one heap OOB write in
> >     audit_log_entries_show
> >   platform/x86: hp-bioscfg: add missing bounds check in PSWD_ENCODINGS
> >     loop
> >   platform/x86: hp-bioscfg: fix new_password_store overwriting
> >     current_password
> >   platform/x86: hp-bioscfg: fix ORD_LIST_ELEMENTS never being parsed
> >   platform/x86: hp-bioscfg: advance elem past consumed array elements
>
> Hi,
>
> Thanks for the update, I've applied patches 1-3 and 6-9 to the
> review-ilpo-next branch. For patch 4, the approach in Josh's patch seem
> better (IMO) and patch 5 seemed to be changing dead code (AFAICT).
>
> (And once again, I really hate the amount of unnecessary copy paste in
> this driver.)
>
> --
>  i.
>
> >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c        |  2 +-
> >  .../platform/x86/hp/hp-bioscfg/enum-attributes.c    |  4 ++++
> >  drivers/platform/x86/hp/hp-bioscfg/int-attributes.c |  2 ++
> >  .../x86/hp/hp-bioscfg/order-list-attributes.c       |  6 +++++-
> >  .../x86/hp/hp-bioscfg/passwdobj-attributes.c        | 13 +++++++++++--
> >  .../platform/x86/hp/hp-bioscfg/spmobj-attributes.c  |  6 +++---
> >  .../platform/x86/hp/hp-bioscfg/string-attributes.c  |  2 ++
> >  .../x86/hp/hp-bioscfg/surestart-attributes.c        |  2 +-
> >  8 files changed, 29 insertions(+), 8 deletions(-)
> >
> >
