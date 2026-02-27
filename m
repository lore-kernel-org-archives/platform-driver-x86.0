Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EDE3A1E6C;
	Fri, 27 Feb 2026 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192320; cv=none; b=Mgw8GdWOejvHKwCaGFfOVfyzc2wNVlD1+W3y78q4ePfcmEVd1RmP3cW0xkG6xrGQZp76VHZeoVfg7P+fTFxiYhCa/Pm4tP42GuGo4bnZCc18GhLTqkhcfA1YSt5KWasQmvdAhqW61HjLikBflW6gIdZY4ECKfkatZgWLZcjLkoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192320; c=relaxed/simple;
	bh=wlCP+H61n/zJqd9SwIg5iQc7GC5AoJs8FVtN8Y3fYMI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fA6GY6BtpHC2a6FVUuVODuZn60jtIlW83BxqsUPCGAOeP5ILgewR45N3dU5SgVMvfw/n0I56utvBKt5egvLW5SRzdkEZGILKsdJAgdV+Gbse4sm4v0454pt4J1SnTLZtTVetXo2vx1JMSQnJOO69H7+UttQZV8PfUgh6Nz/+NBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLNm8hxc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLNm8hxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772192320; x=1803728320;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=wlCP+H61n/zJqd9SwIg5iQc7GC5AoJs8FVtN8Y3fYMI=;
  b=ZLNm8hxc5yJ73lrVjvnXD47kOJZpQpwLuMeMey0gkuTzSLBZ/g8v9r/U
   7S5dVrXnLEY2c6o3CQjKndrI2FZzOHGu63WpQQLTdrRwX6NFJ0o+npjbK
   /Xxn2+eeNsmx8Q+J6qTQ2RTQKQ+WW5xoOGAbVM7FyV7njpmp3I41rNh3a
   lYwMmQdwqOMqYc6tkJg5JRq+HmfN31x0+X5Vu7boPA+JAUyZ5abFrCq2D
   MKPVKCj8q2T39IrYuKPYtaTY/4zEMPXWVmZhuS6h01mw4I0FDHdtEUPBe
   gcpuEh4Vu9oGKZr1gFeh2YL4CW0ZHz2WJ/B9sZkIcWrLWynfZbH8DQv5S
   w==;
X-CSE-ConnectionGUID: jyKkeoOUQ2ePHGilUIlj9g==
X-CSE-MsgGUID: e7VNWTJxQougZcuj62BX2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="98739842"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98739842"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:38:39 -0800
X-CSE-ConnectionGUID: zTWf3Sh5RdSoEPCbBQqwKg==
X-CSE-MsgGUID: 1UPU2N1FTPSNJ1gW1tZbHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221498157"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.144])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:38:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260226141944.352923-1-denis.benato@linux.dev>
References: <20260226141944.352923-1-denis.benato@linux.dev>
Subject: Re: [PATCH 0/2] platform/x86: asus-armoury: ppt data for two
 models
Message-Id: <177219230755.7567.16624072524862325129.b4-ty@linux.intel.com>
Date: Fri, 27 Feb 2026 13:38:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 26 Feb 2026 15:19:42 +0100, Denis Benato wrote:

> this patch series includes PPT data for two new models: GX650RX and FA401UM.
> 
> Cheers,
> Denis
> 
> Denis Benato (2):
>   platform/x86: asus-armoury: add support for GX650RX
>   platform/x86: asus-armoury: add support for FA401UM
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: asus-armoury: add support for GX650RX
      commit: 622cc8d078e5d7586f0e40dd7aea515a946da48c
[2/2] platform/x86: asus-armoury: add support for FA401UM
      commit: c55b84fa567ed33bc651675bcaf8d53bd12d910a

--
 i.

