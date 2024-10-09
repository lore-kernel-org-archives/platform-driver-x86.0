Received: from sonic307-22.consmr.mail.sg3.yahoo.com (sonic307-22.consmr.mail.sg3.yahoo.com [106.10.241.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1729917B500
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Oct 2024 23:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.241.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728517606; cv=none; b=TUj11EuePjedF+/Y2ylHv6tJOW03ygaHMz1f3VafTz9LtemAj1eyVwlyeSKFUZ0OWlZbMuaIQstAfcZYTn57zEo+axgrLzb0AWxaO9nU1G0XSGU9BTG5hnCQEdm4ybsU4cSIVMCyygncSPqMw3bzP5dxdfr3EurRoRpJFn2RdeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728517606; c=relaxed/simple;
	bh=cfaRjA3CqOTxRD7nUUWHlYZv23A9SpOnzpBVDTYyXQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=nmQJWvc/AjWf11PZvuv8T8aScs5zSDAlrsgwMaQgiI0aHo1Clc9qLFvL1Xq98/7podICIUHBjTdX0lxcq3JVnu3b1N3Lh4XKMUzZtP/2yzP8kr50CpuqOx6clvsYZUBA/H/snPI9XrOy4wQrP37tZmTkon6+ngt0FdjNAXzkO6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com; spf=pass smtp.mailfrom=myyahoo.com; dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b=A4CS0ziy; arc=none smtp.client-ip=106.10.241.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=myyahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b="A4CS0ziy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=myyahoo.com; s=s2048; t=1728517603; bh=fCwkOM8TYV+wxIKhbJq9MIh4fDUJOApi7mvbAmFs+6I=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=A4CS0ziy5Z+FXJlpkVRituAwyVEHuyZJpICAWqYF7aROqulFBETIjK73D7A+ihJYZPW5VPpZY7PVBduVb+Ta5cjpfKcZ7iILQ9XDbq4whs38/9zoe4xQy72GTu70K0+nFLVx3/wgUU+MeiVzNQ8tXesB7+rMRijy65HfJCE1w0PGRJLUuVugRuxgfHuw7qHQfQR0RvQ7nOnthu6ZDitF9CoQdW5beaHV5rn9JGJxuiWDsuSB1M47Bc2udvfYIIeKev/6ci/f7YlJh15hzLBiJVUj+OxPLhTgn4lBR3yUy9lL/TD915FmUdkN7/4immDpbSxT0tBOBWVBWVsQWzwSRw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1728517603; bh=dRIkfKUAE0uZe0vIzxe0W9UotEjX/W4+EfOpdTQ+is3=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=sN6x13YHbCmdY2LD+b826pZg2MmTESDvU1G5a7JI2wf7oT6r6pCiRXbQFYk9jk9mMSiFX9p5zkVvYuKUysXLo9chsUV37FGG87OBz0H1qCIsgZdsT6c8penccJrYrCWQeGieOvDxfnt411vswW6lZQTFRci3VcrorZ/3LSsey31WVKDd8rm3nQxmuBvG+mV/7YXvObq3Cf6Vgg8PfSShkJAjBo2cyS5U74u+3KXtb5VDJHGFRIagJhisTOuKgD6ajNoPU56mtNQHXslvc2gE1+mnmvVip9Z1f1dxJ8L6PbYtoexykbDP4sKanqy3Qs05IazzHRqpb8wZ7YvqKkHVtg==
X-YMail-OSG: LAqXbcsVM1nw4.MA3icLGCWBMgxXA9bNb.NaHzjvCRm.LhHrDpB3T2VXNy0JdBQ
 FvzvAuPOp_GmNhaQH64T.j9.2cpiBXJuYI5uGWCYhPtrA1O427LjcPPgcPjiJ3fSV1VvvgE2mAZb
 uh_ay_MGdD9GjtlxygN3NQ1WsK2mToUcxASu1F6nXtLUTvuCQU0JfmIdcWMU8mYfy9I_lnmqpd1o
 RoN0dc0RSU3OUPzCdS5bXVaL5cyh69fbgr72XGKEKG7qpBnCqWrBTwah4QUOgmiXQTJr0ucHm6cW
 p.38n.K.Sgk1w4RxYsfq9.xrxnMIPRN5XGoXKz9y.ilThJmDxX.KMvWfsi4mAkEw74jsD2Iv_lE3
 4bOGHnKi8rrFmBlSCGtgJrQlMwBAHbkjGFhgxwPtXFzTMLHw07r1NoPEwO1mrWxHhQBUkFBFpGf1
 4HW2N9ojBS2MRXNn8_.hMupuz0fOsQmxrZ8M3z7qJlueWn_l63wOT2VP26jItoUKY3RYDAS6_u5s
 092kAZH0JjdMMLmhn1xxRFN.fvEwxJSuVCmdsJvWesgoyEoXct0ywRXgUr5Z.klPXXZGV6QHOVSP
 x6DR8HZ_gZt9cm7vEBVBycdSzfAeLJsipd.y2A5rWEbEn2n6Ap0u.JuRCiZQVb55K2mqfajgbw2R
 QJvB09GTD_Vvnau8_OSovoctzBPpsDYPj6olyVyX4ig5znf9zjQsWacdNwM5EPJ05O3duhpWvwtb
 Aw0WC1v0cP7UmxzhTgxOwwFg8ocCuc3eEd0bdrtgXIoPBIb9GGjPfD5ZDbnzyE3mE3UWFvWACX9K
 o3THHua2BUI4Ayi8UPCSzreR3EmZKjcoMeSAu6utGwYRSHfFYnjWI1NHgTRicaF9wIffUB3rjKNp
 R7EAJCfb8dXi7wrjee2kWqzlzzOYKi0G_4kKPsh4PXlw0I5ARjyToHZAztZByeMwz3qE19qgPNXv
 waUP5_oQDm3fY7UWz5IDLyFMtwNI8xGtGRWMI7.lyflgMyfjWz6smbH2ibWNXyj0M0qR7SMw84FV
 G.SOpkv6MwDPkDTBZP7mLYK5580bagECkoU3sVlln8xTNWmvNIQyFt0U.YmjYy1eqs.VNl6MnOr_
 evGyqpvcpWRBixqxnQUwg6fdu7Dg3AubIo6g9cxJ9XJ5gPZaZLphQ_Ne_hud7O33d9vRwNT.03IY
 LgWedJQSlZmhleVzKtdD7fbuu_nnHJr0y5WnMHA7CZcixtDAbvxB9gJXhtvMtFTcRYEo0LS5I7t5
 zciOTgB1YzyNXCYRwRA_dxYn2yzG3e_nIw_y_r_mcF1shNMb2yWzA8nKxSdQ_8isg6bCMmyVDxjt
 SJN9bvf7upDlWHzxMCnUkQJiF7XMthl11PFK5jocccdGjtPGliHX6pSgZkpU7vIZZ26wTxlSfeeK
 qT9BDqLtJzGOalw4.2jCgDecIdWnDQm0zc.oPyPkjw2JYP5ZtbxcFg_N3qyKCO3GFKIBCNMZoTjG
 EeK2jPB3LUUYxiYNHc9rrabt4eRi8W5xFBBkvwcUdmYktjdgWRyQGFZnKDrw2ri_YLZogQxLcTuV
 xgUs7VYaGlay45DcsA8kbzIOWZhcOLGx6S7V_BgOQY7M3o7_AQIMEUtkeWjn1qWigFGKwBPVckDn
 WrWWNsMRXSIaL0B.VYyya4gbi3Ig2W_ivw3HxzrYWqo11ueqgjK8jZKneQqd9lQiX5UqB1y66OTf
 ly3gEm11EdkuIx11gpSE.azHHSc6SRz5un0e4lY6L1.fnkzpM4mUtoZufEFTNt4ANQAAVtgeoQLS
 84ontRuD716iiNLbrNjByJRwWS3shaaL6x1Il.cwFOxSH0LJcU0DVS3Kmq4aPN.57b4I3pDyi.c8
 D5bXpD54xIYNKKUrjjsTZ0OMjf0v8fax7BSukW1tTxyXPnpS93U9rFtRI_RFYMSXR4.mSsvx111v
 O0GU9cyPdMHouIB8Tu5L1x_F2XYtdUBlU9XxOOKHkq5sIWlnEiAdJxhZz8A_KYZU8HZCWyMw1VSL
 YSXd72K0juqRomEokkBN_wL0Hlms1J_ez237VR3YwXRyRYXeZcxAjkNsunBZvOxt0H3_ThDQkwqN
 3NpJxoyG__d8hsQkotEMt8pAcPYNK.4uGe2XP.oy330veJbPrR37o7TnIoYvl57pzbOq8RmoK0pN
 QVt_w3NLWusMXuOmN7W2W3LfTuaohqcai4ChdU5uzlvHIUD9EbgviM9mev40ddNppQm1IPUclojQ
 SgO7PQSLM3KeEG0wN5QjpdFvUpuC69UyUwYfX.r3hv7XLwp55PnbKt_b20OCyFQWsqA--
X-Sonic-MF: <abdul.rahim@myyahoo.com>
X-Sonic-ID: b416c6f4-eb5e-4393-99e5-d3f766167a5a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.sg3.yahoo.com with HTTP; Wed, 9 Oct 2024 23:46:43 +0000
Received: by hermes--production-sg3-fc85cddf6-qj99b (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b4e7dfb9ad5f3db34c6a2dfeb82ccf54;
          Wed, 09 Oct 2024 23:06:09 +0000 (UTC)
From: Abdul Rahim <abdul.rahim@myyahoo.com>
To: corentin.chary@gmail.com,
	luke@ljones.dev,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdul Rahim <abdul.rahim@myyahoo.com>
Subject: [PATCH] asus-laptop: prefer strscpy() over strcpy()
Date: Thu, 10 Oct 2024 04:35:58 +0530
Message-ID: <20241009230558.51892-1-abdul.rahim@myyahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20241009230558.51892-1-abdul.rahim.ref@myyahoo.com>

The function strcpy() is depreciated and potentially unsafe. It performs
no bounds checking on the destination buffer. This could result in
linear overflows beyond the end of the buffer, leading to all kinds of
misbehaviors. The safe replacement is strscpy() [1].

this fixes checkpatch warning:
    WARNING: Prefer strscpy over strcpy

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>
---
 drivers/platform/x86/asus-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 9d7e6b712abf..d460dd194f19 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1832,8 +1832,8 @@ static int asus_acpi_add(struct acpi_device *device)
 	if (!asus)
 		return -ENOMEM;
 	asus->handle = device->handle;
-	strcpy(acpi_device_name(device), ASUS_LAPTOP_DEVICE_NAME);
-	strcpy(acpi_device_class(device), ASUS_LAPTOP_CLASS);
+	strscpy(acpi_device_name(device), ASUS_LAPTOP_DEVICE_NAME);
+	strscpy(acpi_device_class(device), ASUS_LAPTOP_CLASS);
 	device->driver_data = asus;
 	asus->device = device;
 
-- 
2.43.0

