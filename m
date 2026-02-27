Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB2E346E5E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 23:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772236706; cv=none; b=psefOY0X9cbUjMZtS6smIpH2ubqgXt+DmziVfN+XQYPGcuQCbaLt2YZfsRSsCJJplkT8qsaPaQ0ryBVw5+h9KG+Sg0YZWICbEL3GtqygTzs4TrTXccJlQ48nXULF/aRKWq8u324/tGTTG9vam+mgK7+oLavcPuOkFivyTHT0Tvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772236706; c=relaxed/simple;
	bh=IMDlf0XvaWfgOWCWVo0RJQ+VjvQA747+XCrcskgp574=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LP3w+Zjg2w6R9LjJnLugxb414ow2tBhXFUMjItdE2hYuQSL/UZwr4W8QOkUPpRzd5kmJI7epOCi+15FrBYB/LPe+8CQUSXrPEu4zW2BGGQ68YvJZYHYnAoT894GyzSCag7DH4Wp+xBda2aYRp9EERjrkBQsJivHCGxM9Ofasak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unarin.com; spf=pass smtp.mailfrom=unarin.com; dkim=pass (2048-bit key) header.d=unarin-com.20230601.gappssmtp.com header.i=@unarin-com.20230601.gappssmtp.com header.b=MCZeCQgH; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unarin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unarin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unarin-com.20230601.gappssmtp.com header.i=@unarin-com.20230601.gappssmtp.com header.b="MCZeCQgH"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5032e59c8d3so3040171cf.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 15:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unarin-com.20230601.gappssmtp.com; s=20230601; t=1772236704; x=1772841504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2JWWQyBUY0qzwlUw9+Hz7w012jPQRN3LWvLLUI6WAs=;
        b=MCZeCQgHiKFfhHx+VYezy1JXvETU9jqIUAB+XPYlN8qsdDusuQhd67al02Ra7WCiG6
         kYyEgJdgHXww4Ab9/NWVYrrztzHcRHOxcHMjG2lF8N3njveogz3P1OeEoyUDaDgPN+0l
         7hlMOihPlBiVVZyzegLFQEmrktF4qYbPYYLZIY5JCwylBB2dbvCdrTbXZgWTfnuF9ysb
         Vbif8USWIxQOhd7T5V3Pdcrhu5znMBC7UjWsvg314YVHkz2oN0I5jfvML3ks6V3k6JL8
         56bnff0yMjTldJaTK56KlP1kX3dpMzUrMHierz6isdnVewRvasK4M+htc1ucXexgDwPK
         W1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772236704; x=1772841504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2JWWQyBUY0qzwlUw9+Hz7w012jPQRN3LWvLLUI6WAs=;
        b=wneNXbG+AqO0mAJ/wAasFb+gbF0BRcqoj1UXo5UrA/kjFgKPFF53fb9vP52sDzA9bF
         hB8V+v6VQ7rb+DBkBH9pgFWnbTySfTan36AvGnsI8DqeHyIHLKGZRjeIAidCaXhJXKWT
         Ba/K6/GfR+f5RhVa99+Qx9TCkjRZxbGl0cf/tnmMQwLCAgIqIE6IS4eZtoUF0iu3NaMb
         tXIKx4SqFfR7/oIWGAgtTe7iYi2E5Lg/oK59umWq/Tes+DqBZZAsnAVXGA1Osps1qw0E
         2WggvQqB7Qpa9O3Yd6Rri/fQ5VGP4AsF8JvBzVQRbdJO4FsIYFrd0Q/5n5fcFtVcG45H
         khjQ==
X-Gm-Message-State: AOJu0YxQ4zOP0AXEyaCpcb575qb+G/W3vyELrtawfvY16Xu6JRpSosmS
	39F9vdGUgPSbYXPXlhtJ6qIk32yVQXG/PHRmvM4pEaFWiHrWc6VfO7dglVeSVpvaeWg=
X-Gm-Gg: ATEYQzz9dGXfiIJhRT0WqPWqWa7De83eOkZx1RztKgTb8clk9n8JReaROKxforW7JHv
	DZdA6OxCT17l1MzrLII2m0aGclKr4ZkOLFZaukVVWQpy2KHKyhjJS5Sxcn2iAxWwMUfrZigwxRz
	HDGJX6veBM6yBN7QxLRhrbqFJfNIG1MmEgQqiVbHI5MAXTaw1DF5lsV101azDw9NzerGd21Jk1i
	FqloSYmPjmQS3H8NzJrZvUxmkycYgMEesTwjW9LsQ7znImD/ef+2XhYiu28awE1c/qRJS3z4lh0
	7cBJ7yb16BzKMUL6paT6/ZV8nh8M2OWhR/0x3VydabEWNtRJNCXD6toUVd5fUo9PcO6R0N8H9s7
	GU1KR4KSm29lJeZi/FfeTuBPmCc2x2vUWcWoq0ZnyM0mp4uVRAs2/dISl6ZCxcFAoUoPyKn3odF
	BtMlpf2Me6U7o6lwGycRsfuUg5BzNzfkco71QloiP5kF11N+MzPRwkU8Ttz5elh8mgJnFH
X-Received: by 2002:a05:620a:4004:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cbc8e7a050mr492458285a.3.1772236703982;
        Fri, 27 Feb 2026 15:58:23 -0800 (PST)
Received: from [192.168.8.121] (c-73-141-215-85.hsd1.pa.comcast.net. [73.141.215.85])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf66c515sm589733585a.11.2026.02.27.15.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 15:58:23 -0800 (PST)
Message-ID: <0a07f07e-e33d-457c-9597-969a17affadb@unarin.com>
Date: Fri, 27 Feb 2026 18:58:14 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to
 dmi_vgbs_allow_list
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 alexhung@gmail.com, hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213044627.203638-1-peter.metz@unarin.com>
 <177186444423.17917.14945673795280235334.b4-ty@linux.intel.com>
Content-Language: en-US
From: Peter Metz <peter.metz@unarin.com>
In-Reply-To: <177186444423.17917.14945673795280235334.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

My pleasure Ilpo!
Thank you for the review and no rush at all of course.

Cheers,
Peter

On 2/23/26 11:34 AM, Ilpo Järvinen wrote:
> On Thu, 12 Feb 2026 23:46:27 -0500, Peter Metz wrote:
>
>> The Dell 14 Plus 2-in-1 (model DB04250) requires the VGBS allow list
>> entry to correctly enable the tablet mode switch. Without this, the
>> chassis state is not reported, and the hinge rotation only emits
>> unknown scancodes.
>>
>> Verified on Dell 14 Plus 2-in-1 DB04250.
>>
>> [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-fixes branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
> local branch there, which might take a while.
>
> The list of commits applied:
> [1/1] platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to dmi_vgbs_allow_list
>        commit: 6b3fa0615cd8432148581de62a52f83847af3d70
> [2/2] platform/x86: intel-hid: Add Dell 16 Plus 2-in-1 to dmi_vgbs_allow_list
>        commit: 857f5036f8fd729e097efbe3ba421b75e27346cb
>
> --
>   i.
>
