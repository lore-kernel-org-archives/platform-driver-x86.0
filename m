Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A913C3F4C;
	Wed, 19 Aug 2026 16:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158055; cv=none; b=WkQ8zuGxkjfx+mp78XRlLqS9sVpF0oObv4+AGHH+PWSEAITbTeg+Zvk2RN3OZledivzbkdYRD4UMz+qneXwqxAl0a3yFqUdfgKhhV04CiZ8HP/FMJGlBpoYGy/fNFldFJQmhkV8MPYfrxGW63XlPFwIHfUSIuzNiIhuKlnur74g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158055; c=relaxed/simple;
	bh=Vqj7tIPAnBRclduL2WmlwDJK6vR14YxHGzla8SghDeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nfUDtcj5j2JOYehkcVv53YvCJ2IdyOJ3DzxHyuY7fUu+HFPCvFgefkzCsiSjgvkQHYuaoXVy4D0f9ywpdG9ncSUiC6tmutiQxbgTX0GexMTuqPdPAm9NHMoFg5G0MgA5ca98WZbq70E9JROVMUBj23YAmiJRco0bTv6igqdWso8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZV7KPNR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZV7KPNR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8701F00A3A;
	Wed, 19 Aug 2026 16:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787158053;
	bh=U5FpNXxtaqoLz2WRavlKchvmYJDSxNY9cQXwnz9zSv8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UZV7KPNRaUt4jc3RIkr1sLPB76f6/qasE0QgkGgdTcFnvRyiY/IVwW/C6JWydol1X
	 /fhUSIbRltSGRO5+/o7P/0h4Ab2iJJxjGmvZmMkRFDi6otX/Z0QDNdPTLSRQmEOMU4
	 WY/eRLoTd5bU8Y5RmjxVtlXiKwd3HyfAX8y47SH7smdUxLI9pEy8gk4MLvUd5yH0B2
	 Cw9b4xnxxuOtsEs9RwaCz74F1uhCtUBAXFZgJtQMht++xcTNPmJBVjuTdmZ7E6Arca
	 9dG3xFwIbYKu3ZbAy/+GSkNr6Z8uOfOYejHK6aITrhS+YhA560BOFjJyqRK0P3ioV5
	 raafQYHcWqW/Q==
Message-ID: <df08c3c2-665c-46b9-a495-1ff0818be6f3@kernel.org>
Date: Wed, 19 Aug 2026 11:47:32 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] platform/x86/amd/hsmp: Family 1Ah client support
Content-Language: en-US
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260819073157.2426504-1-muralidhara.mk@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260819073157.2426504-1-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/19/26 02:31, Muralidhara M K wrote:
> This series enables the HSMP driver on the Family 1Ah client platforms,
> Models 80h-8Fh and E0h-E3h.
> 
> The client parts drive a different mailbox from the server HSMP
> interface, but the latest BIOS describes it through ACPI _CRS/_DSD the
> same way a server socket's mailbox is described, and the parts speak
> the Ryzen Master SMC message set instead of the server message IDs.
> Patches 1-3 teach the driver the message set and let the client reach
> its mailbox through the existing _CRS/_DSD-driven MMIO path, leaving
> server behaviour unchanged, and patch 4 includes the telemetry table
> those parts return. Only the ACPI driver probes them.
> 
> Changes in v3:
> 
>    - is_client_platform() now tells client and server apart through the
>      ACPI-reported PM profile (FADT preferred_profile: PM_DESKTOP,
>      PM_MOBILE, PM_WORKSTATION, PM_TABLET) instead of a hardcoded Family
>      1Ah model range, the same signal amd-pstate already keys off of.
>      Future client generations are recognised as long as firmware
>      reports the right PM profile, with no driver update needed.
>    - hsmp_desc() now resolves the running platform's descriptor once and
>      caches the pointer behind READ_ONCE()/WRITE_ONCE() instead of
>      recomputing it on every call. Concurrent first callers are benign,
>      since every one of them computes and stores that same pointer, so
>      the pair only needs to keep the load/store from being torn or
>      reordered by the compiler, not order it against anything else.
>    - The client message enum in amd_hsmp.h is now documented with
>      kernel-doc, one @member entry per message describing its inputs
>      and outputs, rather than a block comment plus a same-line comment
>      per enumerator. Noted there that not every platform supports every
>      message and that an unsupported one returns -ENOMSG.
>    - Patch 4: the Telemetry Table RM layout moved out of the .rst and
>      into amd_hsmp.h as real kernel-doc'd struct/enum declarations,
>      giving userspace one authoritative definition of the byte layout.
>      The .rst now just points at struct hsmp_telemetry_table_rm. The
>      structs are now also packed to a 4-byte boundary to match
>      firmware's actual layout, and the trailing NPU/PMF counters and
>      spare padding firmware carries after the overclocking fields are
>      no longer missing. Verified field-by-field against AMD's internal
>      metrics table header and end-to-end against a live snapshot off
>      Family 1Ah client hardware.
> 
> Each patch builds individually at W=1 and is clean under
> checkpatch.pl --strict, kernel-doc, codespell and the htmldocs build.
> 
> Muralidhara M K (4):
>    platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
>    platform/x86/amd/hsmp: Route metric table through the client messages
>    platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
>    platform/x86/amd/hsmp: Document the client telemetry table
> 
>   Documentation/arch/x86/amd_hsmp.rst  |  24 ++-
>   arch/x86/include/uapi/asm/amd_hsmp.h | 398 +++++++++++++++++++++++++++++++++++
>   drivers/platform/x86/amd/hsmp/acpi.c |   2 +-
>   drivers/platform/x86/amd/hsmp/hsmp.c | 273 +++++++++++++++++++++---
>   drivers/platform/x86/amd/hsmp/hsmp.h |  25 +++
>   5 files changed, 688 insertions(+), 34 deletions(-)
> 
> 
> base-commit: 775f2078b38ff2121410a35302497a1e81b8e459

Thank you very much for the changes you did in v3, I'm happy now with 
the changes.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
