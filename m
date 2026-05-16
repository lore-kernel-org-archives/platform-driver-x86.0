Received: from outbound.st.icloud.com (p-east2-cluster3-host8-snip4-7.eps.apple.com [57.103.77.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10D32853EE
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 07:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778917860; cv=none; b=fe3Ed23LI3j2MoV1PQHsuEEcM2Yn87jRwHP0NtEaXKfQvanuf+38Vr+eIUVQN1waZr3ZIa7lvp6rWWuoWgXriK/AiaCzgbPbfXemeXKcto6igpXWTkAVOajbXENhUtsXUtuB3fKg3yzoE1afOzS0BXxZowlUNeDfKHpK5wOycsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778917860; c=relaxed/simple;
	bh=C1d/iQawmZWTYR3DitHfHVtfwIgD0hdpf+3yd9/+MiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hioufHgAwM37oevUATrKsN6EUw5TT3UPSund2ql/K8L+IVmBdz8ryfZBJRLBSv8aVJQN9JyzMYbDCoBQXpqOTGcHa1ZZ+QA7ET2c/CpYVpyZ9E+bqyfMEVPLuLExzYXqhSpcCVeRt241hQrZ/2blx6X9u2Nis7LsmEh3DGzaWPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=Sspac0wu; arc=none smtp.client-ip=57.103.77.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Sspac0wu"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-4 (Postfix) with ESMTPS id 087AF1800546;
	Sat, 16 May 2026 07:50:55 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEG1sIUhhXE1gTVl8OXQIwUBtfAkIPHBNWFRMLU1ZRGFwdQAhUClkVC0EFXXcCURxWDVdDVARfUEsbDlQXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BeCF4fTBwdDlgGEh1QHA5RBVsARglNAlsHXAdAC0gdXAFcBkUUSR4OXw5XA1wbUgZSWQtGCThaDlsERxQXG1wACUtGCUkdDgRUB10FXQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778917858; x=1781509858; bh=xCd0HX7ckDUyLkNWwHPtCs0YqgrbaUiZ5r2ITtgqGbI=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Sspac0wuqL730xSUyKebGw1p9/cphHy/QipxGeg/TE+6VhA0yZs6ROmCVHso6bm5V7UjPd3sK/Juy04d+LvfzRUkJ/p0SX2yb3kImNhgUweLFyC7e0EistTZkwmafrSx7GHoQncBVkrhg9d6oVzSo7NU60cTQYXw66oqDwm12sbkuS0X8wsuSeL+cSw9AAx91ibAoyDllPJui2GDa0T8oTufCP4VTz9ZwVQBIfgNhboLkJBKu5zkXG/+hCgWC3paSqNhC5AKoh7JZNtyctX5BvVO8PpegjG3Ud5rVepaHM0aWDLPfF9oQWtrgiP36VbovrydBIwImJo4+mHFs//B7g==
Received: from localhost.localdomain (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-4 (Postfix) with ESMTPSA id 07175180024D;
	Sat, 16 May 2026 07:50:52 +0000 (UTC)
From: Cheesecake <cheesecake2960@icloud.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheesecake <cheesecake2960@icloud.com>
Subject: [PATCH] docs: fix typo in lenovo-wmi-other.rst
Date: Sat, 16 May 2026 16:50:02 +0900
Message-ID: <20260516075020.16745-1-cheesecake2960@icloud.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDA3NSBTYWx0ZWRfXyAo+RuErVNhV
 uOUl+I0wiC5xTu/wkgAatG3fpJN2g5KBMIB9xYEHLTlLcMXsu05Tsnecrdnj0kyeTHXKMh/kKvZ
 qyqEKXXam8FhRW2cJUj5s6J5sTi8Y/IjuR6OnML5i3+7HhTrGMHPn5XbJOiPdTtEvGEZyPSDXTh
 kHl9bHuzgINKmqMiqdCK56Qdmb0PinvA9S40sGHpw2vX2UN5BzWoPJm+PGS++coDlWBZ9sV9Gy7
 it/n53oifPvEoiXmfdPrfS315S+eRZSGRv22FNYtFqwtvLRjkXLR+BdBQ1/bynMaDyglyk6dfk8
 6F7LwcrPxM6KirjlM2ttFYJNhiVWFnWC1jBbsAHdMYxR6pZvhjJKuxAXT0hqCQ=
X-Proofpoint-GUID: KHkGJzjM1BiqEU2iAUUTNWrIHaeN9qUm
X-Proofpoint-ORIG-GUID: KHkGJzjM1BiqEU2iAUUTNWrIHaeN9qUm
X-Authority-Info-Out: v=2.4 cv=dsnWylg4 c=1 sm=1 tr=0 ts=6a0821e0
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=sIGCgqHK338A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=v3ZZPjhaAAAA:8
 a=XFimlRtmMrNVnj0damEA:9
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Replace "Minumum" with "Minimum".

Signed-off-by: Cheesecake <cheesecake2960@icloud.com>
---
 Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 01d471156..1d0410500 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -144,5 +144,5 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
     [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")] uint32 FanId[];
     [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
-    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
+    [WmiDataId(4), read, Description("Minimum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
   };
-- 
2.54.0

