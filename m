Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEE35208D7
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 18:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789757419; cv=none; b=QvXxX7XO6inmNhdhEQob0KA1cnUlxhC0ebJ2og0gqSb4zQfFAEeqfeWlw3xd0LGjBTkzbfhLW6H6JW/4lWFwFVCIswb8dpe6yxct0eAn7lsbMfKR9isuj8pRzSPr9hMgYI3tLLn1dWpVNXA+OmtZ55L8xBcXkFkauvXvzUFfszU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789757419; c=relaxed/simple;
	bh=E0dIEkBrNpsavfmz8terpzu9tdJ/O2kWHmDPwT1Sr0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qy5n6uwRt+vz9mLNs24gmxOh3C7s7L7b3/T3k7N1i8K4F9NcBFV9BcjRIT7heoyiNRJGULpOwlcbK82HHs0ECy7ddeGVb6RENwvqw535WjzJf/WLJzg+u87GZfq/oSpgmxq8OWd2ZhgK4GWBOqDxijis2C6AxOlZTl8S0OB7moc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtiS9ilW; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtiS9ilW"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso1054118a91.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 11:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789757407; x=1790362207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0dIEkBrNpsavfmz8terpzu9tdJ/O2kWHmDPwT1Sr0E=;
        b=YtiS9ilWLBcMyWlv5Y2aFpH6jdxYPkOFOIGSCCxkUUdRY5aHDTyvSWq3MDlDVKkGuM
         ma5QeEm071R26vJqv8UfBF3VXVPkcbEnX2ZuvPt6nKHYOq4KBc/nKI8YpPsrVk3JZrG0
         +xcf7wndiGu/i13imu/C/UzEf6fy/oo4hQs6g/ZNZEcpGQPjtax+P4117eEjROAto3os
         OhReYfUNZXLvAKnRAb1olp4LA6F9joIk8GLXYIlElfvC5WLjzoozoBibhNOI9cnrUTVu
         EsGILpIlEM/8KJ/K8dQITUbaK+vaKpfvq4VcvF0WlapRF9fRyp7RkADNY6iaANBB1pep
         3Vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789757407; x=1790362207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0dIEkBrNpsavfmz8terpzu9tdJ/O2kWHmDPwT1Sr0E=;
        b=OK8RCf3fuUA1qjOXx0KhgPBKiWq6Rg20kuFqZafb3Oyz3/+JWqLiERHsEJZWD5tmLX
         TG8mbBtn1u2tkWDMpeG9RRvy4MNiaUrzXqpw4TrtPQqkugcMzY5155/1kek9hTemfn1V
         VT06voTVQ+bpRzT1NTk9YgoDbLv790si9jxLAUuaTLC/+oA7o2FFJn0ugtQw6EZGSL2C
         i4mdVNGkejOGxKkw9U3qUf4IMR4JmRcqYgHgP27DbleOOutsW1m6nRaafGqhEgKOO5IY
         55h3AMmHbh1GXf5NacDfx37B8U7PATJEROEawkG3B5v7djcyNYpHfthsYfEihblKFv6i
         5keA==
X-Forwarded-Encrypted: i=1; AKwUvBxiUrz1VSkWHKYTSppXqFuSlS9niKM7KUZh1ngpNbJgFwPJ8KiX+V0ZFB1MB++AqEFCGnaTDK6V97FvYDshXmpLYoBe@vger.kernel.org
X-Gm-Message-State: AFuF++lW5WhonQe4/40NmvJCmpZXm1Ew/e65vGp0b6NqB6aQEBd/vzHh
	f8GEnk1fNEKBhxUZW7NwJOWgSi9osuMcHtztm1fK/VZ/ipep/WRB9dpz
X-Gm-Gg: AYBFou2XhAOON76KmvZnN1/LIvw2P4+78xBbGacj+gMNLNdnJOiLofuxvKjlQEUjO+M
	X12C7N8srDsJP1N5D1VvikiTQkbpCoAgIqprQBpsXN7p7QMRkL4aUdSWWNLCNIbaDcNgKmOMm+R
	NC3PqiUOtMD+Bsuwtv75wOJxm/hsR2jDvGwF8VF9GFnmS0CpPdkv9Ahe3/GGYYNh4Kf/Tsffam1
	KIHMC32F9KHlEAIF/ED7bTvvckLCt0Gwh0Eh42cJi6jP/gGtK9MISC9wsnkTQH91PGto5153mki
	XvhHMV5LLL2RTrk+BdzotP+4mRakqviJ9LFz802AXUI5A6LThSs+GW2OcbY6fTAxVGxF0BkgYqy
	lwIFu4R0KQKWpZ8fgYL2pGIAkSVModfvE/YwNYfG8pL/p/sGiplsu8iVzEMb4ECSIQAqSWIVQ5e
	YjYnsmBkkVa8tySjS1l+5L2stbcbOwxQF9IAWvNAUOchqP4gbi1KQ/hPcRxa1iHj1SDnb1JQhhT
	k28+Ab6AHLjzus=
X-Received: by 2002:a17:90b:56c5:b0:39d:f95d:bd08 with SMTP id 98e67ed59e1d1-39e55008a3amr13452150a91.14.1789757406972;
        Fri, 18 Sep 2026 11:50:06 -0700 (PDT)
Received: from arch.mshome.net ([115.243.91.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bf991sm658555c88.6.2026.09.18.11.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:50:05 -0700 (PDT)
From: Daasaradhi Mannava <daasaradhimannava@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <denis.benato@linux.dev>,
	Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: msi-ec: Report valid charge thresholds when unset
Date: Sat, 19 Sep 2026 00:19:55 +0530
Message-ID: <20260918184958.6211-1-daasaradhimannava@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <12cdf224-08aa-d19f-62fd-fbc6e26d6103@linux.intel.com>
References: <12cdf224-08aa-d19f-62fd-fbc6e26d6103@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[Resending as plain text, the lists rejected my previous reply.]

On Thu, 17 Sep 2026, Ilpo Järvinen wrote:
> This seems similar to case in commits:
>
> 186bf9031666 ("platform/x86: asus-wmi: do not enforce a battery charge threshold")
> 78bf392ba77d ("platform/x86: asus-wmi: temporarily revert to setting a charge limit")
>
> (The latter reverts first one as userspace could not handle -ENODATA but
> thought the feature was available.)
>
> So ideally, I'd tend to think we'd want to return -ENODATA when the
> threshold hasn't been set. But whether userspace survives that is a
> question we cannot ignore.

Hi Ilpo,

Thanks for the pointers.

I agree -ENODATA describes the state better. The asus-wmi revert was
caused by upower's udev rule reading the attribute to detect support
(upower#347). That was fixed in upower 1.91.3 (commit 83f86c75,
July 2026), but current stable distros still ship older versions,
e.g. Debian 13 has 1.90.9 and Ubuntu 26.04 has 1.91.1. Returning
-ENODATA from msi-ec now would hide the GNOME battery health toggle
for most MSI users.

Unlike asus-wmi before 186bf9031666, msi-ec never writes the threshold
at boot, so this patch only changes what is reported: today it is
-10/0, which is outside the documented 0-100 range and makes the
limit look set to 0%.

So I'd suggest taking this patch as is for now, and switching both
drivers to -ENODATA together once a fixed upower is widely available.
If you'd rather have -ENODATA right away, I'm happy to send a v2.

Thanks,
Daasaradhi
