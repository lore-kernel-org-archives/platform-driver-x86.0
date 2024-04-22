Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948F948CF2
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 08:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713773548; cv=none; b=k60r0bPromStJAJfJAccjvI3OlilDXv4tVBtp5bVCJA/4Gz3H3GN5+R3UmjVipKYi9k5cN/iPlcKbfU2d0VE4cpGuS5gFRQYJqY8yye/S3shmkn3klkBSagebSEf2cSTniBTWMACrEw3jS+dgZdFR7US5fh57Ewhr27h6us5oQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713773548; c=relaxed/simple;
	bh=qbDlLFNVO4x6gAeeU7l2z+E9coMIS5aOXfWsGqCnv7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yj17f0ydLyHN2/W36ozIHSDjIR/ezZn1jOs8ElYGnxtn2+lkpGi0IpSEVDcSz6ZM8SdcV0o1mQKiwBxx3Xqni4yx3hMWKY2kX1w8THQo8TKfQemcI/a6Y5aAQ9Cv6Jd8VK4NByGpNsU/djBHGfq1B+PDu+spw1UoG2DHMzll4E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GY+vaUWG; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GY+vaUWG"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e78970853so8220376a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 01:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713773545; x=1714378345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbDlLFNVO4x6gAeeU7l2z+E9coMIS5aOXfWsGqCnv7M=;
        b=GY+vaUWGZNbiA0ePYFWPddHoLZ8qIR6dtH6bWf2pdDRuv4NZh7HW+EyRA0Xa/t4lLH
         DwcCPpZCJZv6Qp9Nd7Cc9rkOZIpg8sOIuFpsNLc50InjKi16O0oZEbDQZbogfY3uJXd2
         exWl/39tBjFFciYKDp24EkX1Ftg4b6UjlaRVspGPTJLLnk6XqLZHtT95/1PEx3DJI7EE
         5Kt+/tdSxvPqGxH7UtGsKNUP0rHkux599PgP7Xk5gYj3TMUzUcsj8mWYr4OvohwG1mkV
         LZuaDKDVebiOW5LExnuycO+qNnZvAtP2ZgAS1/6nAUbqK+q5nFsACSLjBBpo+LMIeRIQ
         StGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713773545; x=1714378345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbDlLFNVO4x6gAeeU7l2z+E9coMIS5aOXfWsGqCnv7M=;
        b=CN2kskyVBq+ZNuQPEejOID2t5RvSQyaHoPUmWj1c52mzYShyssD3XF66LzuPWTx3Bn
         lHkYDr+szF1Bc8YDMKZc3AVBKV+FK/3wy37WEqaASSIGxnZbLMeMnwxeS+qrNmUCU7rV
         7pRZdO1zqI/6+5nYIYc3cLXV3coxdLv+vCfSyx+epQDAnlMoJybzJRnbQaaSUV9owlQb
         2H5ySjN6KmJsXvydEDE+QwNKaI9YcHIeX2sGMt4c5hfj+Vf+CcdFf3iuw6UFHN2JRnl0
         QctOkq2Ngxaz0zVqLPKQV0/FOzStn2AhK1G8W2lEBkPgivWwmT58v4QAxBbNgaduDdFe
         PxEg==
X-Forwarded-Encrypted: i=1; AJvYcCXVN7Tp2ZANj/7RmMH6qP0Kr1gGU873nkev15C6Z9saqezWc54xbhaQ7eAiVuSn0ptSsVORVvsd50HmYr++2GNptb0YO9+f6UoIR3LvCcNFumJKuA==
X-Gm-Message-State: AOJu0YyO7JTC99mC1hEAOkqygLVo8V0g1I85q+B34r57Y/YIu8jAGbbX
	QzgqZRtcIHQtI6OtutB1MmnwT0Ao2XW23j1wYF8riOPhVvYOMK2iOfvdbIzEVUCwwEy5Oydy3AS
	sk/7Dhzxa9nTH2kg7aCLwzd0MOJ4RcAwI
X-Google-Smtp-Source: AGHT+IE69oOFWfi7CqD5yKNcCqmBI6jkWHnZQALlp+F8+Gi10+mfcsCi/kqrocVwuuY9mCR118pQRgcJ34nxFf+iA58=
X-Received: by 2002:a17:907:94cb:b0:a55:b25e:a2df with SMTP id
 dn11-20020a17090794cb00b00a55b25ea2dfmr2953969ejc.37.1713773544603; Mon, 22
 Apr 2024 01:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240421154520.37089-1-hdegoede@redhat.com> <20240421154520.37089-4-hdegoede@redhat.com>
 <4f62150d-da65-7ecf-fc5d-50afa5dfccb3@linux.intel.com>
In-Reply-To: <4f62150d-da65-7ecf-fc5d-50afa5dfccb3@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Apr 2024 11:11:47 +0300
Message-ID: <CAHp75VffM9nygSf-5Hn7wvo-sE6awma2VoFumnV9Xjj5d_d-pw@mail.gmail.com>
Subject: Re: [PATCH 03/24] platform/x86: thinkpad_acpi: Drop setting
 send_/ignore_acpi_ev defaults twice
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 11:07=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Sun, 21 Apr 2024, Hans de Goede wrote:
>
> > send_acpi_ev, ignore_acpi_ev are already initialized to true resp. fals=
e by
>
> Wording here is odd (but I'm not native so could be I just don't
> understand what "true resp. false" is supposed to mean/fit into the
> general structure of this sentence). I could nonetheless guess the
> general meaning of the sentence despite that, but you might want to
> consider rewording it into something that is easier to understand.

I read that as "true and false respectively", which is probably better
to be spelled this way.

--=20
With Best Regards,
Andy Shevchenko
