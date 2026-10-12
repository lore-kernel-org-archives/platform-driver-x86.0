Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA3849A3C4
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823013; cv=none; b=sSgHMlsbqwPd67AMF3W4sLE8qERySfeSLQVh2yaXfL9XCkkseCe0/SiB6lnfnBjg8bUYevQF0tL2DQQerzANuDYxPloY1t+LVyno1t/AFuO5mP1XqgPN9dzGDgGW+OJgEI7IRVogGRHH5OlYBqYJVP4BxWLSItV1aHuk5C/bOys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823013; c=relaxed/simple;
	bh=zKOiI2LfF7GJxUuzFhyPU+XQaX82+0OGcoc/SFQO+u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GO7Bq5hVfm8Z7bdOyBc3RagN2B0L8dCqAnUS/l1jgvU8ZMWMCRorTcPLLsBJK5jT0FXGqAir1To0WfgDBeY3GmDAJ59XUoMcM9hXKtO8f/wh4cdc4xYHWaIL00e/hyO44GCXqp3wzsHH3pAhUq1fqmsP6/2KDn95+uGYG9c2YAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcaL84JO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcaL84JO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BE51F0089B;
	Mon, 12 Oct 2026 16:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791823012;
	bh=Q658V/sHngcrPlnqaJ25JQwqvA5Y0RBLtPQXABN7bWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jcaL84JOhHDlcWEc8+5GMla6CdVUvOyMj1/3cGja2Ndad6uP7+W35UfC7tgENpw89
	 kxLFuTiJvr2xOwuXsRp7oUN+dA3CdNCljNmQKkmOeFnDOOBu4V7GDjTRG64/tBb/p5
	 guUEGU9daWCGfnFZ3z51Z2PRGQHDI09UD62kVy5vxWRIfUniHZb32KXa05FGbJOZYR
	 8p4jiz49TBuKYMKCsEtSGOd7Xe/SBIsxmsBCyL0fquTgZmCpO//HQ1SAVJRbr74p3q
	 PZ9wzHHx2nZhAISzs4CGurKqlQrstmLXhFjUbwAnK86rgnaqqZY1h89NrFNdt/0jQh
	 MfgQa900SSBRw==
Message-ID: <ad567795-3909-47ee-aec0-e2c3b95a0d21@kernel.org>
Date: Mon, 12 Oct 2026 11:36:50 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] platform/x86/amd/pmf: Add 1AH_M80H support
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/11/26 05:05, Shyam Sundar S K wrote:
> This series enables the PMF driver features on the 1AH_M80H platform.
> 
> Patch 1 stops sending the legacy DRAM address commands on 1AH_M80H.
> Patch 2 adds the static slider support as per APMF 2.03.
> Patches 3-5 add per-platform TA ops, the signature size handling for
> RSA4K signed policy binaries and the Smart PC builder support for the
> new TA.
> Patch 6 remaps the metrics table on resume.
> Patch 7 passes the custom BIOS inputs to the TA on 1AH_M80H.
> Patch 8 shares the TA policy apply code between the TA versions.
> 
> Shyam Sundar S K (8):
>    platform/x86/amd/pmf: Skip legacy DRAM address commands on 1AH_M80H
>    platform/x86/amd/pmf: Add 1AH_M80H static slider support
>    platform/x86/amd/pmf: Abstract TA dispatch through ta_ops table
>    platform/x86/amd/pmf: Get policy binary signature size from PSP header
>    platform/x86/amd/pmf: Add Smart PC builder support for 1AH_M80H
>    platform/x86/amd/pmf: Remap metrics table on resume for 1AH_M80H
>    platform/x86/amd/pmf: Add custom BIOS input support for 1AH_M80H
>    platform/x86/amd/pmf: Share TA policy apply code between TA versions
> 
>   drivers/platform/x86/amd/pmf/acpi.c    |   3 +-
>   drivers/platform/x86/amd/pmf/core.c    |  50 +++--
>   drivers/platform/x86/amd/pmf/metrics.c |  13 +-
>   drivers/platform/x86/amd/pmf/pmf.h     | 246 ++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/spc.c     | 206 ++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/sps.c     |  88 ++++++++-
>   drivers/platform/x86/amd/pmf/tee-if.c  | 252 +++++++++++++++++++++----
>   7 files changed, 801 insertions(+), 57 deletions(-)
> 
> 
> base-commit: 9cdc0dcc1e3677fca59bb314f2ec9e33383136d9

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
