Received: from 11.mo584.mail-out.ovh.net (11.mo584.mail-out.ovh.net [46.105.34.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B424E36CA
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.34.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612569; cv=none; b=FfmQ4c1olOTcKQrf9jsjQIRABdr/K3Kt+ta5fggk9UheS9UTVjuVV8gXjydsfnAvB46GAPzGEa6C9VVR5a4mYmfF7Xcpx0u2Jrjvkpi+0i8oNkyKVmaP2rgwJTeg4VUMk99NYNPmzCqeFRSY6cUE/LUWeyWn3FgGhELc9n2EbqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612569; c=relaxed/simple;
	bh=88rVedFhxqOdR27x5I0bHCtoN2wziyI967j5BXtuKaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ds70ZuqaO7LBgtKRF81KKEkfyY++upyOJsJHRo/Xx8hGMNqiPbaxelz4kXXGA22YJREHKJAKfBDBdF3vv6Mz8tMQAliX4HwjjkldtUlykQ6P4SyXvfuKWOzglwwJHBVsbalQOwrJF+5gmugy6RDxuegqX2FenhkqJWy5ThT/RXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bobtopus.eu; spf=pass smtp.mailfrom=bobtopus.eu; dkim=fail (0-bit key) header.d=bobtopus.eu header.i=@bobtopus.eu header.b=UJYZepi1 reason="key not found in DNS"; arc=none smtp.client-ip=46.105.34.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bobtopus.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bobtopus.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=bobtopus.eu header.i=@bobtopus.eu header.b="UJYZepi1"
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.231.19])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4htmmw19BNz8SKQ
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 16:22:40 +0000 (UTC)
Received: from ghost-submission-c7b579475-dl7f9 (unknown [10.108.42.126])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 05712C297E;
	Mon, 28 Sep 2026 16:22:38 +0000 (UTC)
Received: from bobtopus.eu ([37.59.142.113])
	by ghost-submission-c7b579475-dl7f9 with ESMTPSA
	id w+6eLk6UumpwvxEA/ZOadQ
	(envelope-from <bruno.boi@bobtopus.eu>); Mon, 28 Sep 2026 16:22:38 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-113S007973b7cbd-cbc1-49bc-9eff-a8abd266efe4,
                    99F57D8295E04052021F6BE73B89593FAD7611CD) smtp.auth=bruno.boi@bobtopus.eu
X-OVh-ClientIp:212.68.233.96
From: Bruno BOI <bruno.boi@bobtopus.eu>
To: mario.limonciello@amd.com
Cc: Shyam-sundar.S-k@amd.com,
	bruno.boi@bobtopus.eu,
	linux-kernel@vger.kernel.org,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add Thinkpad L14 Gen3 (21C5) to quirk_s2idle_bug
Date: Mon, 28 Sep 2026 18:22:29 +0200
Message-ID: <20260928162232.714426-1-bruno.boi@bobtopus.eu>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20c15bb0-abf3-4a34-86e5-712f8f131acb@amd.com>
References: <20c15bb0-abf3-4a34-86e5-712f8f131acb@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 10687041917137784582
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFjQfW8CHoeRMXHG+tc8jIyH5nK+RO+OBkvOxHBFrCEpPIlM7YRXOYuxybRXGVpiC/YmQsuC93G55NNjG37BnCd9kFN9HeFhXhJA5WIv9I/5MDozs6pcIspqJN/2OZjXBGaUDUbbna3pIjRuoCPJNVQOvPNt9nvaeYzML7xxRU+9KApTDk0gVAHR3vlMfV84QXI2dHRczTBkesoOnFPoRU4RL/A5QYk9iXHlrfKS1xwVEMFZx2xQgIsWlGqCh7jn0mX7PFbdMQ0SZK6lQ55jQ5b74Vd05DHxqkaqOdm7hojpstj9tWyJSwmIfQgXOCbRwKHJgcZLTDO8ivSkZ6izAXmao8ke5a/MIVUKcjtRH9aPmKmLy+dnO2IXJjmNAGPPLm1nBizZIHhBM5rHbPzo83ajd0xDpil40DH7ozPGAENYGnBid+OdxWl9lo4poytUli14NLsqk+4/3mWZnLSkDK15l4Qt+W2Db3FmIY2pj3sBJ36l8zYzYZ6ENwmEoE4TgKluoGkUat630JvOAFt9y3Z67hThet++aCvFKvDUEgHncb8KTtaCPCuWJsuHmhip71oXRWouzRe93zVnnibLYTCJpXp4lWpDoYcgHMZHvB1kpwuk7WeLVfmRpW0HHBxq274uYVd7Wj05BgTEmn9wZBz+qgK80oAnAhfpnZzzqBPpQ
DKIM-Signature: a=rsa-sha256; bh=88rVedFhxqOdR27x5I0bHCtoN2wziyI967j5BXtuKaQ=;
 c=relaxed/relaxed; d=bobtopus.eu; h=From; s=ovhmo3865769-selector1;
 t=1790612560; v=1;
 b=UJYZepi1dIrG8WWKXunnXf73Ys7uzN7n5njEzgYJ1JG7FTuXgMCqL1oA7HprrYJ6KphdyrfW
 qcrZGrWjZgPCGUsYG+ZWttRhkdBasCzX+1jcy63BbZ1w0yTf64b0gved15NnbjsfDpSCPxx4lIV
 bJQZW6ZG3WZVLhfA+i3DXkT4Y7FKBXXHiyKiYssX/xw72dvrSwAlZBTGFPEJ5skrYCDpQezEuJq
 yrCrcdD+2d+iuJKa5K/ykNCoPxYGBACGplWsAEut+pAOkr+N/NgbPWf5rIhOfeLXdYbSLie730e
 Cf6C6kqVend8wLCIQxm8sKn2x2TswlSVojCQ8uls6Ap5Q==

Hi Mario, Mark,

On 9/28/26 11:09, Mario Limonciello wrote:
> Mark,
>
> Since it uses prefixes rather than a new entry how would you feel about:
>
> DMI_MATCH(DMI_PRODUCT_NAME, "21C"),
>
> On the 21C6 existing entry.

Works for me — and it should be inert outside the AMD units: the "21C"
prefix also spans the Intel siblings of the L14/L15 Gen 3 family, but
amd_pmc never binds on those (no AMDI0005 ACPI node exposed by their
firmware), so the widened match can only ever fire on the AMD types
anyway.

Happy to resend as a modification of the existing entry if that's the
preferred shape.

For reference, the v2 as sent was tested on 21C5S05800, BIOS R1YET62W
(1.39), kernel 7.2.8: the 7-10 s resume stall is gone (kernel resume
in under 100 ms, A/B tested against the stock module on the same boot).

Regards,
Bruno
