Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F9F3563E1
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Dec 2025 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764961739; cv=none; b=oAbVKdMFW8KSWVfk4h5OcfmKkE1gz8uvaMzc8rwBdH544CK1/qhWKDuxzFIqMZpnVW//sVgV/x8r3AQ1PK3+9y1JmggCA19admFC0ZYWaES3BtSwB6xcqAQR5kab0NeA0Xt2WTXX5gOBGyZH9qLCWB5AeOWtwajAVubomYnTY7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764961739; c=relaxed/simple;
	bh=/grqmQu1VT4OJGmtEwd0eouKcRmgcIoQ7v05Ao7XrHk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ucf21Hfxz7/xqlHe+ajZFi5ihFVdaz5JielshSijBzigVyEW9sSVtw/v6ZqlcBsWnB1PATs6/v+58SaPpYu3kUdfRNR0m30PrYsWS8bANkXAD498jrRnw7cuzWJ1cwuNjfI9K21fzlY4yZLYqp49urJ9OmknqzhwOWhaygYHT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVVLwHnL; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVVLwHnL"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-640d4f2f13dso2683579d50.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Dec 2025 11:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764961734; x=1765566534; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/grqmQu1VT4OJGmtEwd0eouKcRmgcIoQ7v05Ao7XrHk=;
        b=bVVLwHnLTYKJQZNIlx+t6t90LNRc+tTZtPCvj2mhOStKwEgBsrlcZi56AdWSnGQ/Gy
         B9J0irioHnS34HSM31wASI5pBc60IEHF83Shr88sNBhqPxo5WIcWh/fxZyA/QvQEQw6U
         rCsert9vOxVDxcq71jRzqi8w8xtPzNvVBNB5hLfd6voYbp4jDcKzIniHJrEsbGFWhE4T
         8u/MgHZc5iWU2t2+yenKvEDdRoiKFxbXZr+BXiy5MSkIEl0l1oybsW7MNXOfKUDB/ilt
         dIf9/xEiUj7zjj+Jr2CsVI2uW2wPXlIxUui9VLbnzJqbK7xNkkAlAghMiD+eQXOZIexm
         mIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764961734; x=1765566534;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/grqmQu1VT4OJGmtEwd0eouKcRmgcIoQ7v05Ao7XrHk=;
        b=rOEbeVLawhDhKd5tT1tBr5wgzWdxHAypTp1G0s2eWtRiiUdiT/lquMLyHzn2DyUWHV
         Am2Tz7PGLrdqw9AHaOVNAhFdGC3NKMbGx1FidUhBQ4lGbhcoUmwsUME6Kq6oXP4e91Sx
         mk3JAYp/PA8C50wr8MyLXHcZ+3pmDGpO0oEOSo0NvCHggyaGbTNhTaLMT59bXz3Q4rIa
         r7wm23jWHsS9d2PWW8WMriV/Yga9AiQfLEOnxuZIKw7o2DaTDSzKtqncfxHBjJj2vkaP
         mI1xYfxs1Utb7xFY0yXXd1vkrgjZMXJEr60m/zx+Yfv3ggdnTZYBXKP/+DcKg0wsO3ud
         dARw==
X-Forwarded-Encrypted: i=1; AJvYcCUNuCscHjdMzYwnNl85k36uP2WM+sTy2HD0iKvz4eunOsvTO74necPn6ouyYj3/qMjlEaDUtJpN2YebMwOZDVPSa/e2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+2UE0udY7nvRpECmEXm+NZWGfS6MQU+eIqjo8XRA9XcMjkfg
	YanbViIiMpGYX1tLGvFnEFD/+oJFxCQSN9z0j2MALtKCOTGZqWLBbFHiw/4E6g==
X-Gm-Gg: ASbGnctWtST3zwVIZAZO3kadlxwxXvM6jBYyddVmo2r1AWd2yu2wyrB94ZgnpWyRclE
	gahvHNw4RCxzd3FvCP0o3lRi+RkKl4b+EIr1jxoA7DzoYWxDR8W2ec/T2QUtAmGc6scg2GkzZjh
	r2hjEDCnAonVFKEHCSgYk1xWC0ptkMi0IQXzpqgKssrtfU2+Ul2U4A/3cxX2NWCd7qYpP/Uwgzm
	w7QGXZlkcS8CzcXB5KEYT/DA7t+F6qRDE65CNqWo8VyxzHWBKA/IR9SHjKj66mFH0yoMjzbhUiL
	DfTCdp85NUF43Lb8HeFGTyT+jkkkbseYb+my3pkbPgajXNqOWIjKkgjSv2hV2iDnXaPlMtnLmxl
	Ssx3tpX6SiWwOoPF4nL0mlUWHuyG3Aw5ogfWX2R1d6Hem+GH526pKYGS34fY/EwpA6DyhYEMTZ/
	VC8gk=
X-Google-Smtp-Source: AGHT+IEX7oWGtpUVsXXjxR9P+Xx3Cp/SwqG6uIJhXg9cHA93n4Hs0R07hsL3LJEP/Kf8W8TPpPaznA==
X-Received: by 2002:a05:690e:2506:20b0:63f:9937:6cce with SMTP id 956f58d0204a3-6444e7ce92bmr6669d50.61.1764961734438;
        Fri, 05 Dec 2025 11:08:54 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6443f5a3e81sm2114261d50.16.2025.12.05.11.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 11:08:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Dec 2025 14:08:52 -0500
Message-Id: <DEQIPUKHDQYB.2LLGMK25N40VN@gmail.com>
Cc: "Hans de Goede" <hansg@kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 "LKML" <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 0/3] platform/x86: alienware-wmi-wmax: Add support for
 some newly released models
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Kurt
 Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251205-area-51-v1-0-d2cb13530851@gmail.com>
 <49c9bab4-520f-42ca-5041-8a008b55f188@linux.intel.com>
In-Reply-To: <49c9bab4-520f-42ca-5041-8a008b55f188@linux.intel.com>

On Fri Dec 5, 2025 at 2:04 PM -05, Ilpo J=C3=A4rvinen wrote:
> On Fri, 5 Dec 2025, Kurt Borja wrote:
>
>> I managed to get my hands on acpidumps for these models so this is
>> verified against those.
>>=20
>> Thanks for all your latest reviews!
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>
> You don't need to signoff the coverletter. :-) (Hopefully it won't=20
> confuse any tools but I guess they should handle duplicate tags sensibly=
=20
> so likely no problem in this case).

Actually, unless I messed up something, this is b4's default settings
:-). I'll take a look.

>
> For the series,
>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Thanks!


--=20
 ~ Kurt

