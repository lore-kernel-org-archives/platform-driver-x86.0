Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E2B3C871F;
	Thu, 12 Mar 2026 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328384; cv=none; b=TXpw0xp8X6um/N4lA3JcQu3XtuS+TiDOzlisCcPAugs7FZV0Se6FIxq9Lnn2yMHO8ofizoQJCShkwhENR6m1dXZ7AScZ6ByvEf64DqjuINZ5I4XV2XDOFrldLhO8oIUqaQDkRulF+HdfOJ4qOSR0BLTqYdKpCf+7UCABn5EDkq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328384; c=relaxed/simple;
	bh=+uVZHmCvH6N0NYZ3ZR2SnLFWhOYTyhiJqlrvhDQmJtY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TBc8C/OWOR5mxw1YDr0JafAbo8aKqxPD3BIWbhbz1agsEfCe03Zro0vku0p8j4SLFIf+QY5+cZPqLLSsOiZh77JKXEJs83iegKPrkLiL9iX58RyK7Xev8pY8XSMfyY2wkQDxH8YyRydLjxz2QM9X381QfOFVmOvZ0T6LwqBknp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hFPoZ5kR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hFPoZ5kR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7B60F411D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773328376; bh=uFSHnJsT5rufL0kLtu7rBgsALDTtyJby5Y76awly3qQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hFPoZ5kRo5C4yHQuPo7UUPR1VPrxdiekHUwpTyLfTfH5lJJDBMmlOivYZwz2OvQYN
	 HKGdgJkS9qC7Q1XTa27cUI41DOhC51vmZR5JBomA48ZT9x0xhwzxqwgYafi2hBCHK+
	 vXm3rAmc0cJwtnkQ0jeJMrSu0pGAZRTzmNFB3xSGTj3lvAt/lJi3Oe/QMFk8VXdo/m
	 g508VZLk0pQvpxFF97m81RD0oL9RlHVqWw1iY1/8FpBBk3PmLrKYxkSg6PvUG3meCO
	 yziGRVrXI2BvpJ5xD9wxNfAJztek0BQAlSBcIT3tFGbctv+CcHPOLdQIsT5odIVoUF
	 MCm/TB4XNvA6A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7B60F411D3;
	Thu, 12 Mar 2026 15:12:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Werner Sembach <wse@tuxedocomputers.com>, Randy Dunlap
 <rdunlap@infradead.org>, W_Armin@gmx.de, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
In-Reply-To: <5bb7a2ae-9754-4375-a1f5-ef23916e26dc@tuxedocomputers.com>
References: <20260310234022.2085232-1-wse@tuxedocomputers.com>
 <20260310234022.2085232-6-wse@tuxedocomputers.com>
 <363b80db-9bf3-44d5-a756-e64d29bd36ec@infradead.org>
 <5bb7a2ae-9754-4375-a1f5-ef23916e26dc@tuxedocomputers.com>
Date: Thu, 12 Mar 2026 09:12:55 -0600
Message-ID: <878qbxozd4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Werner Sembach <wse@tuxedocomputers.com> writes:

> Hi Randy,
>
> Am 11.03.26 um 05:57 schrieb Randy Dunlap:
>> Hi Werner,
>>
>> On 3/10/26 4:34 PM, Werner Sembach wrote:
>>> Adds short description for two new sysfs entries, ctgp_offset and
>>> usb_c_power_priority, to the documentation of uniwill laptops.
>>>
>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>>> ---
>>>   .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>>>   .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>>>   2 files changed, 37 insertions(+)
>>>
>>
>> Can you give me a lore.kernel.org URL or a message-ID in which
>> I replied with a "Reviewed-by:" tag for this patch, please?
>> I don't recall doing so, but I could have.
>
> Thought you did go through it because you gave the spelling corrections,
>
> Sorry I can ofc remove it again.

As described in Documentation/process/submitting-patches.rst, a tag like
Reviewed-by must be explicitly offered by the named person; you can't
make them up yourself.  That's something you need to be careful about.

Thanks,

jon
