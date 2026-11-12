Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489629;
	b=W2HtcWlY0zfpxxX5OFCGYiBaycpXn2n7XzxJT9H0+Y8pBhoM/77H+UMZ/I37NY3PeWK7
	 mfYScCUGbcIjh/v/Kug03YIkuOq7KRdmclOQjFWsfUGotLvqNJFV/U4cD43rWbLuqAT9s
	 xY8PfWWAthfUWyM+MPnE72rBZLifVuFT2pZqpU9atdfcl8z+zOsCnkqNXDku4+jgKzX3Q
	 0qjxUrhkioh8TEZVnKgHxXVElm7iTAEt5a2kJCBQ9ozfRMsrgw/0s7jnUZmyPjKSjZCUF
	 C309XO47DGilsjG/j9/UwxWLDqdLMyR2rnGp1YIqLeebQ/hDhKawmCzQX9C8p0WHDyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489629;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Vo78gArPbl6QofEvmRdbxiDKIDTYmXE3WIoMtNUy2t4=;
	b=ppj8bMvwUfeIbc31sht8baTUl7aWZLXcRcv50sOy8xlSt8hkL58bYrhya9wLDFE/hKUo
	 LtVjuyvzYoXcuXedOJNvpZkxWQIKgWQtWJrBohMh0vDUZtA1DDXGbTKLTqGNHkzThqbwb
	 PP2+VcUU3mrp9KT60ZK8KEpzRjhGoWtdUGFMMWkm+2OBEXQmsZGA8sIY5oOVvCeKhIP8z
	 0BVfTnAxzy97ojPdc8SCgNhgenJmMiGVGOB2BGhei82H0lUJhJ1d0blBgfahfmwuxgHBg
	 VkZi9ZtPBxvdGradlBjyLTEvdJGL2yPh0FyEGld/8AP00I6KZ935v18EVSJM7GYFR5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dK1qi4Cx;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780E8606A881;
	Thu, 12 Nov 2026 13:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 780E8606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dK1qi4Cx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794489628; x=1826025628;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nGaT6sT83iduq3rdBfoJHNbLhhzlLXs7NOLnyttBSFU=;
  b=dK1qi4Cx+73xvaSZnpLfe2PMXJZc9jHkFRMzMMDg9Rzeggcoykcgxdmw
   lRohTfTv3mxswaYZuXA+k17kZEyhnE+rR35hyPEqdT6tEsTyGU0rMg0/Y
   5FgLuXWixKPSvm/HYX0a+M1wTr2g5aU6bt5WWpna+r39USjdbbWJfhVt7
   mudIq6vKcW9f030LuTXy4+cm9k7B8vrqR4s1a/NgAVEEH5VY43Q/asKK+
   ykjJFD1G/npQRqIzaZmf/OikIgRzvkVqWr8B3zhOHiVaMMy5sgOm+DhFs
   RmEbtFXzUy0ByFtOuZTZxDOocMHYXD9XeQzpgaidgTEsJKMesSSTiLCEd
   A==;
X-CSE-ConnectionGUID: KJTlQzCPR4eaMM00BpjTZg==
X-CSE-MsgGUID: SP0zVINDQIugSEQKs9IwKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3309351"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3309351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:20:27 -0800
X-CSE-ConnectionGUID: qu+e/k23TKa+jMhP86WwAA==
X-CSE-MsgGUID: gxQ1Aec2TGGNpbYB9EysrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8836699"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:20:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
 Mingyou Chen <qby140326@gmail.com>
Cc: KentoNion <kento@kekto.ru>, platform-driver-x86@vger.kernel.org, 
 ted eric <ericted8810@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
 linux-kernel@vger.kernel.org, Chris Taraszka <chris@miget.com>, 
 Matias Civadda <matias.civadda2342001@gmail.com>, 
 =?utf-8?q?=E9=AB=98_=E4=BF=8A=E6=96=87?= <btx342@gmail.com>, 
 powerfullz <wleizc7319@gmail.com>, 
 =?utf-8?q?=E5=AD=99_=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>, 
 =?utf-8?q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, 
 Rsplwe <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>, 
 Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>, 
 Serhiy Shliapuhin <shlyapugin@gmail.com>, okluar <okluar@gmail.com>
In-Reply-To: <20261111141226.9482-1-qby140326@gmail.com>
References: <20261111141226.9482-1-qby140326@gmail.com>
Subject: Re: [PATCH v16 0/6] Merge redmi-wmi into bitland-mifs-wmi
Message-Id: <179448961623.10339.11053227356950196430.b4-ty@b4>
Date: Thu, 12 Nov 2026 15:20:16 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 11 Nov 2026 22:12:20 +0800, Mingyou Chen wrote:

> This patch series consolidates the standalone 'redmi-wmi' driver into the
> 'bitland-mifs-wmi' driver to eliminate code duplication and centralize
> the maintenance of overlapping ACPI WMI event streams.
> 
> Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
> platforms share the exact same keyboard event stream WMI GUID
> (46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
> the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
> it into discrete type/id/value fields.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
      commit: bf717fd76807f979422e3198c419a10ce5da722d
[2/6] platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into the bitland driver
      commit: 3ca9f1aecb9e05777703c089f0a2dffb338482c8
[3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
      commit: fbd391c3a0ae95bac3ee9e34770895d6655c5163
[4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
      commit: 3abfbb21e1c925f80e9e77564d72b8ae8cdf1f08
[5/6] platform/x86: bitland-mifs-wmi: Add quirks table
      commit: 3cddbd15769834f764d76f43fe50e18a93e66790
[6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
      commit: 36e99df6f31f581b7828dc8b15b3ee7fb9ca9f5f

--
 i.

