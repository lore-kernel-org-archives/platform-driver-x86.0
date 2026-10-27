Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=20.13.235.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120233;
	b=J133IPacwGdrorb/QpP5ld7aIKB8AtPGJqgdCi3RMhWiSmbGGRjxQ3/j2yBQoBWW4tVR
	 SH1QKbYcnjxbgqHWo2rW7PImCwg381+MBpjti+IJJ68fzp82qffN/F5AiKqpwkVHV2t5n
	 OHxNGOAz1oHLXdcnNOHcmP0YfbB94UIBtAQWOTgXQMy3cZzoxglaAFN+wSiq1sc9ZVKjX
	 qeWhXvENwqJCgZiYItPJu7McPgVjRv3ephCqd2xa7GA2ROhIgbZhSFp9TnAb/0ENgfqfi
	 StIF3ri1sC82JUd037aGQF/nJi/TsmNrvnHyUVnSlmluE5CWTzR8evdjNpfNUIh9b1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120233;
	h=DMARC-Filter:MIME-Version:Content-Language:Subject:Content-Type:
	 Content-Transfer-Encoding:References:X-Rspamd-Bar:X-Rspamd-Report:
	 X-Rspamd-Score:X-Rspamd-Action:To:Cc:Received:Message-ID:Date:From:
	 DKIM-Signature;
	bh=Mhru2tfXXVrBd+jIwqMpVl1TRlKZFUpqHpEXMRlycSI=;
	b=kNOX5XKYkN+28ZumgxRMrrRiix5aiUC983ErLIABwOm6RUUpE6gY9nSEgbg5pkKk74Qj
	 01FukJ6qwpP7tYVTysxTDExhWZWwTshHLsOihu5H48gJOGY6IZJxnEzKM2NnvpzdC7yaU
	 wOasILoVs7CeaXNhAEHUmjZ/aqcndLYflWSfPNlFHeYIod8Lzw6nDsZAHF2Ur4DUxkZHk
	 KCam83NEP/+Dk1lhq+ec4wEIG4nSG8p3ELNOQGi5jBbzpoinAGUfjkOhLlgcgq8qmV82L
	 3TyJK1cOIedORpt0WyMZLM5UBNLBsCum3n2R9fNFyVmxsqwMTcrrqimqyWvWASr0Vcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=duck.com;
	spf=pass smtp.mailfrom=duck.com;
	dkim=pass header.d=duck.com header.i=@duck.com header.a=rsa-sha256 header.s=postal-KpyQVw header.b=pn4gduXY;
	arc=none smtp.remote-ip=20.13.235.193
Received: from smtpa-outbound4.duck.com (smtpa-outbound4.duck.com [20.13.235.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF54E606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 16:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF54E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=duck.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duck.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=duck.com header.i=@duck.com header.a=rsa-sha256 header.s=postal-KpyQVw header.b=pn4gduXY
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Language: fr
Subject: platform/x86: uniwill-laptop: Add support for SLIMBOOK Executive 14
 UC2
Content-Type: text/plain;
	charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: 8bit
References: <ec14dfae-6020-4f91-bd0e-1778cb5e32da.ref@yahoo.fr>
X-Rspamd-Bar: -
X-Rspamd-Report: DMARC_POLICY_ALLOW(-0.5) R_DKIM_ALLOW(-0.1) MIME_GOOD(-0.1) R_SPF_ALLOW(-0.2) R_DKIM_ALIGNED(-0.1)
X-Rspamd-Score: -1
X-Rspamd-Action: no action
To: W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org
Received: by smtp-inbound1.duck.com; Tue, 27 Oct 2026 12:57:05 -0400
Message-ID: <BA6C06BF-3AEF-49A0-973B-872A05825197.1@smtp-inbound1.duck.com>
Date: Tue, 27 Oct 2026 12:57:05 -0400
From: kinhelm@duck.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duck.com; h=From:
 Date: Message-ID: Cc: To: References: Content-Transfer-Encoding:
 Content-Type: Subject: Content-Language: MIME-Version; q=dns/txt;
 s=postal-KpyQVw; t=1793120225;
 bh=Mhru2tfXXVrBd+jIwqMpVl1TRlKZFUpqHpEXMRlycSI=;
 b=pn4gduXYiWyHtubuX7GR8wsnI8f9rrXQ2ANQh6EFBCS3cyO9zKVzTS/CT445YsE7iN2vtIiwd
 DU4l9aFxu35tzMkCt0HhD77qQAmYPppe8bWbWovIkJm/qzvxDLfd0w4aSkTkZOoaunx6mo27wM2
 03XveoaQsRltrqxdslps7JQ=

Hello,

The uniwill-laptop driver works on my SLIMBOOK Executive-14-UC2
(Intel Arrow Lake) when loaded with force=1, but the device is not
in the DMI match table, so it does not load automatically.

Kernel: 7.2.11-zen1-1-zen (Arch Linux)

With force=1:
- "Uniwill Battery Extension" battery hook registers
- charge_types shows "Trickle [Standard] Long_Life",
   switching to Long_Life works
- "Uniwill WMI hotkeys" input device is created
- hwmon "uniwill" reports 2 fans and temperatures
- ACPI device INOU0000 is present

dmidecode -t system -t baseboard:

   System Information
       Manufacturer: SLIMBOOK
       Product Name: Executive-14-UC2
       Version: Standard
       SKU Number: Executive-14-UC2
       Family: EXECUTIVE

   Base Board Information
       Manufacturer: SLIMBOOK
       Product Name: Executive-14-UC2
       Version: Standard

I am happy to test patches or provide more information
(acpidump, etc.).

Thanks,

Kinhelm


