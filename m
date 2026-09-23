Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154433B895A;
	Wed, 23 Sep 2026 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152932; cv=none; b=bj663/8T4C5oDX44nCWeawl4Wgj8gRd1vPNGXAmwIBhN43CWIhfL/6MVSM9BxG+A3wD5SXevZda/knrrytriSMiatrvEGqWfFcx/7V8sVzdh0VdsneZ3UT76Cu4i8/i3swnCYIeYJrGqcJpKefl3fw4Zb5zO5Bpw9HzFLKlzN28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152932; c=relaxed/simple;
	bh=Ds0lLQIGD49qTqCt9AVXNHiaq076mulh0DHQmhYn+7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ky0JLZ5KETc4L6eCsxX4OsiC7GKCK6706WdAgJjq40YK0wycd92Qwa3jlM870NIKWP57DarazZuRyNMpRTEQ1H188gcXgVdMSBFo62+ZS/uyQ8+v/3n4K+dc7CwT0iJbQCjTB0WOZSdLF4LDOk2knt+qp8rF0TF08fw6XcWfuVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nn0Od+20; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nn0Od+20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA1C1F00893;
	Wed, 23 Sep 2026 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790152924;
	bh=K6Uo4db4HWk/+QvAUhiXj4XqKpnQ/bjNVUnDoN3hjF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Nn0Od+20VQkdv2wSYZ1+0yBmSt3WgA1djUlhxkDmYdXyicfGkHCPJ/SCMec6ENr61
	 V19V9p5HSzZ9tzkqCKjV9kM/c2UjTJx5uVqBATZ8wSbZjP+UH9xgJtWWy9C+40Duq5
	 SUKaAbgtpqP8tc5anrjgdbGGfuzM1g1FY6PRYS+7b27EUywLJ4LTkO2p03fFnghKGj
	 YchqTnnn/qfV1DbOUZgi4+cRNi0Gu9EsQVEcYKAJAQGdD9ntVGhAVr2shiN1hc5kOA
	 T6bGmx3itM99FOGhZGcrAIIfT0jODA92uUly41D1epP0xHUBeXJ8iTCcQxzyha3Lj3
	 EPDv/CevH9ThA==
Message-ID: <41d6bd7a-e4ea-4077-87e3-e60102ebfef3@kernel.org>
Date: Wed, 23 Sep 2026 10:42:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to
 wmi/asus
To: chipang_kao <prozac2734@gmail.com>, W_Armin@gmx.de,
 ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
 scardracs@disroot.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <202609221954.123456@gmx.de>
 <20260923082923.154732-1-chipang_kao@asus.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260923082923.154732-1-chipang_kao@asus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Sep-26 10:29, chipang_kao wrote:
> Hi Armin, Hans, and all,
> 
> Thank you for the feedback, Armin!
> 
> I completely agree that separating WMI core infrastructure from WMI client
> drivers makes logical sense. The reason v3 relocated the drivers to
> drivers/platform/wmi/asus/ was based on Hans's earlier suggestion to use the
> WMI subsystem hierarchy. However, Armin's point about keeping client drivers in
> a brand-specific directory like drivers/platform/asus/ also provides a very
> clean, cross-architecture solution for all ASUS platform drivers.
> 
> Regarding the background: yes, the RTX Spark is indeed our target platform.
> ASUS plans to provide user-space applications on Ubuntu to control platform
> features via the WMI interface. During our bring-up on ARM64, we found that no
> ASUS WMI modules were currently available for this architecture due to the
> existing x86 Kconfig restriction. This patch series aims to enable
> cross-architecture WMI support to address this gap.
> 
> I am happy to go with either path (wmi/asus/ vs. platform/asus/). Hans, Armin,
> what would be the preferred target directory before I prepare [PATCH v4]?

If I understand things correctly then Armin prefers drivers/platform/asus
that is completely fine with me, so lets go with drivers/platform/asus .

Having that will also be useful to share any platform specific drivers
which directly use ACPI calls rather then WMI.

E.g. I can see a drivers/platform/lenovo show up to use thinkpad_acpi
on ThinkPad ARM64 laptops.

Regards,

Hans



