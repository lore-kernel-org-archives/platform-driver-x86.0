Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1652EAF9
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707741448; cv=none; b=sZh31XDIx6la8YVmDVJJd5rGvYLH7DEQ5lJVfTex0iC9QaB8amD0IRi2qxr0iULZinKo0Ns3j+N4OaiH+opJiuocecsyKIXla8Du2PvKhzhHVzoZazh47M7twtbKqcM2J5uoZ8w5ndZt3hdYfwulAH/4uWj7Fyc0a+7aAdkkEqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707741448; c=relaxed/simple;
	bh=bpa8kiXRc2MxkLQ6Zz+8Rr85P1nx2kcG3QT3ibu3yVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asXEGbNz9jmpyk7OIp4bEQ7FI1dHehKwy9d9c/ukFm0EuNCBMI8mhKDpXvXbqZo5nRvqEBWmBeN0qtMCoWrVrV5kUGL8v/KRahuCnJSMnmHjvRjFQwr8YudJoQjtCkjhE9Hitj9Pml3DgteD1LZLfEI3Ya/FggLmpiM62+Eyzb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYrcqGT8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYrcqGT8"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a26fa294e56so424177266b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 04:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707741445; x=1708346245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpa8kiXRc2MxkLQ6Zz+8Rr85P1nx2kcG3QT3ibu3yVs=;
        b=fYrcqGT8YGTbmXnbho7RzA181PofyjXrSMIOWUkiVbD08QorwtAkV2/N9wpUxUxUvX
         pgOV/XNiOypBm4pLUWYQBKmbD5XBqcAQHeFXx3f1faADn5oaiQ2ypglLoYqAGTIQlUC7
         pgSegWmVpx2zht67mCRQA+IuTiSFv+lGEJ4s3FbuLkJ1wvqBth2C13vXNAzRUC3DYOIW
         mIpX86w7D/uDuEyn3ec85SqUbJWqUEIJR05P43N5sfVbzwvyxLikST+Yg3zlKpk9+ZfO
         +SVoCpGXq9CU2qbcuLy4WbSgU3A0AsoKjlZOQQ28cTt/kaM6YpHhGNrU0BOHRNA851J5
         KVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707741445; x=1708346245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpa8kiXRc2MxkLQ6Zz+8Rr85P1nx2kcG3QT3ibu3yVs=;
        b=u8mbL19mqV9MtPKLT4y2zNQlo7wVUcf3m1gyZteMPYLG6D4Tk/+phk5WpOVfQ0cskM
         0ikbt6iQfZGrgcCQggAfVIblQMU6+BJBqv6HKU5jxQIX1lE3DoB3pVUJ4Ad+snhILMyu
         R4uwBIOkNyCQzWQeRNdWFKAMb9dBGpBEscyj5bauYwEapCrwZcQ2RFZmAeP9JsscC2c1
         CNroOCDEZmi9EbmSdGDdwj3O6XL/aULJIqIULjJ/22YgvyXMeDwP2pzfc+ulsmTrSRJt
         6cRrItJ/tgz5eLcV5Xxkdvk19k5O2bepSjie2s/9lijvYSYO1o6z1NPxy9bOkX36RLmm
         KS7w==
X-Forwarded-Encrypted: i=1; AJvYcCWdnrXdfmV9canxy/zjkYtCwqQxek/RyHXE/TV0ih6leeBeSuulblRL5kL7TYOl3tVxZ4I2Ll4Io4y4QFtkSam51gU/uNas827Lro0lhfY90QKz6A==
X-Gm-Message-State: AOJu0Yww/sKf3Ls63H5YZO76dr2N23h0DTtdVqwlgRKuuGZopmWV8lBf
	R6C+6M19c2z6H43XbmMb3em5wIvKEduxvIvx1aluQ2SbeR6gC24/EmlW83fK9m9WlQYUHwES4Mu
	sbkdSqBFgPW0Z0WtxIPe6kfQsUgo=
X-Google-Smtp-Source: AGHT+IF4fqI5rnl3bkGsTFS+sOzFDk9Vqr8pVhFwjEc3TMlOKCeZK/s0ZPrNbPAdJbnvaLM7l8KE/G/6/sTVfFscqbs=
X-Received: by 2002:a17:906:46d2:b0:a3c:bf99:123c with SMTP id
 k18-20020a17090646d200b00a3cbf99123cmr1149166ejs.23.1707741444874; Mon, 12
 Feb 2024 04:37:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212120608.30469-1-hdegoede@redhat.com>
In-Reply-To: <20240212120608.30469-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Feb 2024 14:36:48 +0200
Message-ID: <CAHp75Vf8S4Za_Ye+OvMM8dDQUHaYMLSRwypj2dKHu4F87og_-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: touchscreen_dmi: Allow partial (prefix)
 matches for ACPI names
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 2:06=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> On some devices the ACPI name of the touchscreen is e.g. either
> MSSL1680:00 or MSSL1680:01 depending on the BIOS version.
>
> This happens for example on the "Chuwi Hi8 Air" tablet where the initial
> commit's ts_data uses "MSSL1680:00" but the tablets from the github issue
> and linux-hardware.org probe linked below both use "MSSL1680:01".
>
> Replace the strcmp() match on ts_data->acpi_name with a strstarts()
> check to allow using a partial match on just the ACPI HID of "MSSL1680"
> and change the ts_data->acpi_name for the "Chuwi Hi8 Air" accordingly
> to fix the touchscreen not working on models where it is "MSSL1680:01".

This is a good example to show why we shouldn't rely on device
instances and be stuck with HID. Ideally I would prefer to see the
acpi_dev_get_first_match_dev() / for_each_acpi_dev_match().

--=20
With Best Regards,
Andy Shevchenko
