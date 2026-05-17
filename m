Received: from outbound.mr.icloud.com (mr-2003l-snip4-3.eps.apple.com [57.103.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A64305683
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 02:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778985734; cv=none; b=PWxEhlwVmLBugfoFe3WvG9TTGEYpeVRV+HkblxTUHdDWcopDy6ZauBjE2NyOl1sE4uLWxNSsQGH0AGG7Hi5746XtaD1XyKbX7xlUIMVIWdKRhjRe+7xo1IVQ14QzVcO5i5eL1nIClVzToFJcRnyAM9Is/raFCPT//9IkwXs0ius=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778985734; c=relaxed/simple;
	bh=OncIe2gC/SnKNAlI0PaLDvao53WJKsQj2EsPQVs6ulQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hW5Jp1Nwu/79VhFSyZcf3opTaHW1cJrsmSFjTCa/hA8y+Z0yULov3lfstErLS/U7nYD532SiZ7d3r2o0sSGVqzEcHnx3AFTVM+B8g/UyOa4hjk0WdTd8o7gHOgZBTeJiWbXm6hpBhM7Aa40jaYd6+PnhonjD4h0CfkPKnzZzDZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=Qoij4whv; arc=none smtp.client-ip=57.103.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Qoij4whv"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-10 (Postfix) with ESMTPS id 8D5E91800098;
	Sun, 17 May 2026 02:42:10 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEC0AFBlgARnkRUAFYHlZeWhdeTVEPDwNKEAJeBV1yGVoUXBhTRVEfVFhBDgpcEhhcFFxQWB5GElYNXQkZBkBeUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04DWAZcAkINSQdVGVIERAtVAkBEGFpBCkoFLV4IXh9MHB0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778985732; x=1781577732; bh=bzlf5Lht+VNUH6k5XPHKKikglKgLmfJ8JUdQJHN9xt0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Qoij4whvPvFyG6dGJm9O54sNgXOOu1YU5AkxTXkllw+/0spaKob4xnpHzoWumEMYfTIrELu0CT8zDgDi0GiCw+n86YxAMddgglHFDKieHL7+NWlaft39JUNyavhar9AZhHveehaNGHEMf52t400b+2OwK4V8bGHi3B7Hz3mCwv5dJIjRWfB6d4PBhPFLxImy0iidQaBLEPO1f1FrvUiUOgtdq/tdaUoob/wV7Lkm65uJa1oZrkeYihWWeBdFq9TmpNrg7qIDAc8Nsx28W2Uv2wK/8i+vVlKYAQXZQ8BoLenpwqtwwLm8nr2K7zEbw5nGa3gQUBUxfSyps8X1QzjQGQ==
mail-alias-created-date: 1778972301885
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-10 (Postfix) with ESMTPSA id 624B31800144;
	Sun, 17 May 2026 02:42:08 +0000 (UTC)
From: Sakurai Shun <ssh1326@icloud.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: fix typo in uniwill-laptop.rst
Date: Sun, 17 May 2026 11:41:44 +0900
Message-ID: <20260517024148.9642-1-ssh1326@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516070650.9454-1-cheesecake2960@icloud.com>
References: <20260516070650.9454-1-cheesecake2960@icloud.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fmD5T8WNA0bub2IpHn8hB5XszSeSJ8tQ
X-Authority-Info-Out: v=2.4 cv=XMY9iAhE c=1 sm=1 tr=0 ts=6a092b03
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=ZxuoajvSgW0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=v3ZZPjhaAAAA:8
 a=t6UtJALps7SRIqVoZyYA:9 a=IxSG75etxsVYPPdR13TJ:22 a=STymlzgejnUetJ8yQWeq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDAyOCBTYWx0ZWRfX17qT3lushQGu
 aArG4o8YSPPboQpIU9xZzDf7nNYB5Pe8Egca/zdqi3d3zd5pBpPwncRwUlctOmDEUYtIxTTqHJN
 9bNG1IvOlQUYoJ9vsNLHV8tAzwcNAYviMpocU7sYfurLk2h7GTGEBIt+eUudPs/9iptPRb4Soms
 ADKNtub4CiJuCtViej+DEPKMBvPWYWyvwyeDD259oJnkwDqzXI0ir6e3+u1bukiQApSu2mMRQt2
 9gAkuAirB6KEUtWBo9ZEANXK5ZKvHLrENB+q0pQ8YHL3Umd4Sw4Ix/Jpy2p1+YnckBqKUOc69V6
 5x3qQTauMC24UrxjkdELVfldviPV1qHdzpDQdB/6VXNd/NPLZqSS62nriEMTBQ=
X-Proofpoint-GUID: fmD5T8WNA0bub2IpHn8hB5XszSeSJ8tQ
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Replace "benifit" with "benefit".

Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
---
 Documentation/wmi/devices/uniwill-laptop.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/wmi/devices/uniwill-laptop.rst
index e246bf293..65583b239 100644
--- a/Documentation/wmi/devices/uniwill-laptop.rst
+++ b/Documentation/wmi/devices/uniwill-laptop.rst
@@ -189,7 +189,7 @@ Indexed IO
 
 Indexed IO with IO ports with a granularity of a single byte can be performed using the ``RIOP``
 (read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods are unused because they
-provide no benifit when compared to the native IO port access functions provided by the kernel.
+provide no benefit when compared to the native IO port access functions provided by the kernel.
 
 Special thanks go to github user `pobrn` which developed the
 `qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which this driver is partly based.
-- 
2.54.0

