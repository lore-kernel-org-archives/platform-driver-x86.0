Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02FB364032;
	Fri, 17 Apr 2026 05:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402571; cv=none; b=SAIfXaxbQiww3wbOT1wojvwmqXmawvxSWkcRQJlZY/HXMc5350662yD+3rtW8GwgN6SJFo+QeM9L9nfA0tT+Pi35r9AyqDFKwzv/6jVYDeNAQ1bpSIcZLuCX3ZHM23Pocp0R6X3mu53lEJCRRHVc2lcZoYw/wVmZ0H5v1Btg4sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402571; c=relaxed/simple;
	bh=yB7fUc5Xxgui9Pe7n0AYKIP+VCWdZfdmApiwDbP4380=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CUqEnXkNh/GpTanBX8I/uCLrKew+0sc/jwAqX9SVqVgG6MeLsfAhzDaqe4iaPCkKR7LpaJNdOCY9mMKB6v6o3+JshimiXbG+jd+hWSHQ8GsubPCNFfdKju5+82Kf+2HxJkSxbCRi/HALz7+zzG4WpsJDvfrjlCfvjtcZtqJFhKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lqsPT5QR; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lqsPT5QR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776402567; x=1777007367; i=w_armin@gmx.de;
	bh=QIOb8YAdSV2+WPDZ2PPXOqqYMy2bEvLuv2dkve5/8y4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lqsPT5QRg1Q3fwc4ZouDN5OXOalbA6sa7MzF7Y8Am3cdto6kn+gehMxfF1BeAqdN
	 M1ipHnbTpCTPuy7JiOeZmdCYfUx+UA/20r5H/FwaMr48B9ZBWuONzoIww90UnzbOy
	 lgWIe685vaWPoUL2YPACVj5mQ4b2mxPp//6YD5vjI8hUCeFtMUmhWAtPnvE480bWz
	 mlDI6VoKvTR9Bo5EXongXieN6puLkOlOVMGXiLx5eZL8o1igH/VZSFzmDhk8ECtps
	 L5dBcTTjnHYJw+4pmN2kyK1eK3p15VyAP4RruN51TwH5/WQA9cOUgtfseznWwAoly
	 R1fX5LCwJhIrTSzpJQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42jQ-1wDbSI3toW-00E45r; Fri, 17
 Apr 2026 07:09:27 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] platform/x86: uniwill-laptop: Add support for battery charge modes
Date: Fri, 17 Apr 2026 07:09:12 +0200
Message-Id: <20260417050912.5582-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260417050912.5582-1-W_Armin@gmx.de>
References: <20260417050912.5582-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bj1385uLYp5l9hUJqkjPSNRKk0Wnbzz32CVVrqnUKao1NkwhVd1
 zLWSJYe64OTKt2fFyFZ3K6sujAMde5MOLO6K9z0ribHaGgtZbUICV9ml0VRXR5dtuW0+sAe
 aBSO27R6TI3qw3kIP+70WvtGR9Y7f1VHU0I0yugtb/l8ZqxB2eDomQuiN8/c8rPfj6tirnY
 d1ZIx3ze2tyJBbv5e0uUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VWdXtg7Bn7o=;4wA2vS90kBwytn7/hHkDn8fL5oQ
 y1NP7WB/RXjCOdSSdSu4sY/xQe4U54OXQMvIUiISG712wnSkm6N8gY+fYfn92Z1rpkOJ3XHIW
 U5EDm8KinjI7Et+MkPFVQPlqAw6y+sRoNDMTHEuO43h+c6DnPnISFT8DTZwLjbfDLGx730y5r
 1VNeUUABAJqLySeEWWuMZYAorik82L/WfClBBui+nFrJRc0GVlowS/lEY7rBiWWdjNRDsLlzh
 PZZebm5CNVWeSG2/BEl1PJGb9coLMW1KAUB27VLyv2iJZBatOaSN9Sxb5XjxrD/CTvpEhSSxg
 k7dRNINIz4RtZYv1jSVh08ugsIfy94BZHJIqU99ag1eiAli4eRGSKSGC/jw4f1Wlj2FHZzODU
 JBHgpQWYB8gSkmm1hEffpTagIWGhLqtiwHzO/BjZi37chb5FsWEsTbiFjE4cgDiyuS1WVJuC0
 vX1g+8/bSI/BjQDD5e/iUZ7Z3eKUHaqIX1JiXzCea+IdjLmbrWWZHGlB3nodFGtxApeS3lIzV
 tmiRBRQLhYzumbAJYNItcjluBYByy9N5Sw16RN/X1PnQ2n3qkKvQDHgIZZap1NqDbozcU6WoY
 HE8xkpeaD//iucxVt/7avVNDlZpURCO/I36GqPEr9iZFWKea0xjheVm4rtGAxnDqW+7/nuGua
 E2KyXsvDXRtnfza1Nh/w51farR9mIuYemgmwNMbTk1ypGt07h3hqBOgCKeGWChCqZDI1F1AOG
 r+NuEsm3ocHNdcgQ/6A8HdGypEOJuWcVPuN0/TjGgsDL0dVlkvSz5MAO8vEMpfpHBJ7Crm9ZW
 DxdHnaJVNT7GzrUR/VaApKao6juBtxGwZagbGXZO+tvjb/HKrztD3rX/nPK6MTQCR521oA6jD
 xOX+hk457iLSBgNlDhwzBiO46CYQ82I4goQ6KZmLfMYFs9rLXApKwWTKkLfjRTKCtucGINFdY
 6ZzmpjY92mF7uCcExufB8jeQb+yAMY01o53kjkKa9z0jRkPdLVGOPGfxB+6wDz2yXI0+kg/gK
 xOvEroub/Ht0eT31Nf+ljLehy8MSF3MyUhuvXJT7sxvVJZO/94dE05D7nl2Lw99VuTb95HRtG
 oRmOO0crQdgh0gzq7kwUdCvGXEZyb+a4J/09YDeMOBS8TVxvmIYFidEz9fbr+wN/6CV4DkXSD
 Rz9UoWG00Sbaqm6O44Ag9nwuygSNu7ox07b4HZcCKmmTTgK0+5KuAbs+QPz5eJaGBj8P9qhwD
 MBB/dw/NC2xtvZ8ITrd1xBxTOwjkZVJrmQhpU/mltUInv8jBqzTzYHai4qYyTPdt2eNHNP1Ct
 ksdeCgWWmIsjZhyQlmF0Wtdx5m7KwUOWLhvkJifG++o7GIZDDeD827Rqd5HjXo5dVsxnbgsKf
 lRpdQVgp7qkbFJ1TF1M0ju6gLufOikJp15P+JRbsZVmi/Q2Db5P1VSIPIndJODsv+6ULcofDC
 Ly7h7XWnCkLQMMG7Jt8xDmBdqeFTzuROQRH7iMZwcnln+np7HTIe9F1yrDw4Whr+0+3Z/icCV
 LaHogVL+A/VkxF71AiWKaUHoyXzuplsHKnePZsUSgIdtugQNzrS51wg83BRdug5P3A8xpQia6
 T/ryvdxdem7lDDwSvmyvf253VF/1Qg2hzwomFcPUfZ2SFTQut4KNZfFn1pGF7rvhs9DYKtlyr
 lpQ9N90ljt6HYb2DQGiQPXRQmTjfgG8BOU5TPJ834RDNPhF6OZ9mgoXTnrXzpCj4sE8+BjOCj
 VZYlCxMTHNQqnC/FEmbmY606xlOVGfyK2fC7K/M9fl+UW/U/+E7I1BaJbPcy1v6+hGTR/GsYG
 BZT+DY6gOMxhqAdkl+85O6O7VLFIkpHhUuoghCY+il1szqNhedTqr2T7bpRYiPNQMmvjiY/CN
 Z1Ip0cZ4G24TCQPqzMzoTcRMzdBfFjrb3YNoZDY2Rtj3wD+CyzLuWAGtQTANcRWU+s3vXGUL3
 RVkA2pxeSsjOJWQFiewpwnbzLrq/Fo7TG8ydv0qFTtiBINU38MwvtiBRVFxqtPjCf4eLBsaGG
 clj1TK3KqXIDTlJONZb1i9AQX6XJYB6jt1C9V/gZ7TcbHvyccb+7Q6yfVzcBjBKWVaeGeC1+g
 921UZTzfjzmGEKem83KeBapmmy5oKLPctvALS3yX4cQrGk4XmvxZxXpKQjuwk1bL1/0NlNRpo
 wG8DfLRJZJlB4VDkO3qZHy4H6LNdHGATqK8g+z80ok3PlMgkhKu1OhGpJSdH+GIinN6sJ/g71
 udHoGJu4AiBpGNpNFd/+a9OfnAj4G6vgIpzOFJTN0stg1w67/XEvPvFYNrDvdifDYJIMam7kC
 wmryIanHqvM278IXaj8fmLuwFPmpqyRzRq3gRO3OKzPFI3G5PiJRQMm4Gss8eq095+TGKsaQT
 JW4XnACruCdYhHbjA25WxdzOmA0xjdmGiEfIZBThfaZ7BgZmWmd0Y17wcEV3i6kGWUJtZgm0Q
 Kqmh+jEh4TkZbQfk+HQD32LkQzr/BDGm14ernV+jrmn0nRJROM9oZL4+XPhIx4YzM2dvB1Rsl
 VveaSusSXIU0FBgAYqdGDMskDJO675Drp/WqNf9NXk69sujCy0NVWPp5zZUkKDZUkD41Xbwox
 J9gqOo4Y9PnUOWYz6cN3TMbyYbbTZO22r0moPN3kSZvLNRcyuf1ltyIfLVFk8W1VxQtbijBS8
 N7hDDWJS4B4pJcigk+ZnWVsXs3oom8uyu3xodBWy9yo/FZunULMnHlOVYSiW9iFIKFpl1akhn
 gtV5VRvyZFkMugIAs1BbYUacFlBlT8a6xnP2TEQsvcZ/Le0EcLZm2qDYGJCUDA7o1WtfK1/A2
 O8qIDybC0Jw9U0uLSjBjy+PmogAzNeNxu48kfm1c2NBH1qKDLrpjr3gtNUdcoKZENZlXyAdza
 lrCy74lc2v3H1SdHSQYfa1dftNC5MRVygH+ovhm3ynneG22QErgjEvL9mnLx/5t9eC9nvBedJ
 YPJpY56CE8qYPQ1MpJGDG82nrncaT9EcH0o4tuISNAL6HKQQbhPs2860dQ/ouecgN7aboWdSm
 CJzY9hycGKVUrJSfkUss17OhnC7suX7hMZL9l0vWi0RoiBrR9bl2D3uV8Bh1kLhxN1bBdHY1o
 uUa59nkvyUTt92wWtwx9drjuwET3Gk3IfGekRdiO6E3+5lPIf1JH6aEGuK6/NS5DF2qWXr8hS
 O+TRiQ7qtU2GRuToDESyQbGyRMphGCCesWf3ovNpUf6y0wktzJ7my0ANXxQ/BGT/bwlgTMI0w
 v1k6Qt151FCTq1CLH/vwjlOV+32yd0qD/SiesIep7g2umGTtx220cht0AcO90HD+6yGyxKJif
 rMBepYHhxI3nPqS12Su0r6aYRcWF6g3nHpkTQCMF5oproMCf256/KIZBM0Qno2bE/EJ8Uy6RS
 DpjijVjLGRV1awRJ4u6Mrcpnf2blcyuS18F7/5mL8p1RQeQhnMXmOgX2WjENV+TN///40UCmW
 zp0LfhNgWmpxIohoRhlyhg26P3XD43C2sE9qlWJ03lSsTF5YRURjJRABPtYyjPDkwmwpAqEBQ
 ixQXVACanSKpFIYSbxCPptdMG0vyrWgevlNAwMZjUmOVwSClC7hsO3t75CFAA5yeJxQDwAiaP
 xv28YtIdUhmtkvR0gMNs8lKimgo+3JKVVBI25/gvgSi36k2qMgJJItRRbvWtzW8mpBpkHf3CK
 AUfryzTJjT2XTwuFGJ/s20gipLB89TyaH+DQIGB6feW2Kh+R0UUqaxV6F36ZHG5jZfLE/Slsc
 jBtIGZeslIbwnbLDb/GopNOVIvoqglNp0/PegpyYKv67OusY6tJM/YvX/jYidZVTyTnCV1Ra/
 J9JFSzLqO5rp9bhblnXbpq3kesWAHaeqRxZ9kf/+xr2+X3V4yy14AMf4KneNb6fbwdEtibUFe
 wsLZIECJQoQA6ohykJAhFOR8klWX2eSOXpYcovnex9epGDeb7/JOhuxQjPBAblXw1MEguKcM6
 eMB95E62zxZt3j7uyzry/RSwoPKMVbPrhVJBT3d4AapiEYOB1buejOn1kXqX1oS065ruSAQ4w
 pj5w7NLBK3s94e/gdSTSF0TBVsW2ZNWSRrsvcQvNqADMQWQiwxZMiRxbxtN5eBiYTwfvM6kXl
 w1IUIwfu6PoVdsiK30asuveKm9/WI1rswJ8do6EfFpXeQX4nLTwDRJk1EMJMND1ZleP+mgbSZ
 vXeYJbVlmaYD4HMYXGNdkD0ZoKLdEkiN880n6ifbSwGFoLmLiBUyUz2M3FG4U5No4F8EhEdfE
 NxxbSLMDCJ0twfuHjHVLDK8y7oGDWAwYalJSzQwY/pn55bUKn0leSIPme5Vva9esSuKucUnxE
 R8gH0cE3MI98+ktV2+3+4qiyDwPuxhNLTwc8NzA03/3j9l1m9yxMUrVvzxV+ag01xJDgS8gjG
 2xPwAtn7RL+HOme22UfydXrJleV6tjGH/hrkORjdJ5jRLEwT8/KfdWnRY4xHn0vORBTKaFRuu
 U2cgqYJTKsvujB+gxzkkmnxv6QdRk1egJelOUEM/tFnSDMCKFL4Zm24JU9f7a/76jVpJ7AT0R
 MAfTmFUdBlDYrU4hZQAtiVRyg5t6JrgdhvKzPriJOzXj+xnvX4eAl7uq9Ki7/C0FCoHQN/mrT
 YN8KUavXAmYlxCyAIGzmShDqW3tGjNlDB4v5FhwQlR1BnSJFLw0Ho1VAfLe9wG0lXsNu+GYmm
 pVGGJsTKGojTuWiiy5/KtIkgGiDsWlpDeDSJEmQ+xx9FhK6dlkibc8h1KPMHDp+Ica6ML5yPW
 V6Hr9RjslwJYEob0fmZ9yAcyLRBXCx81I2XPWXoJrFF3gtJ5Zxi3XYXIQHTXTuXFVYg6FxJZi
 3tzZZHOIJLcLxHFWF7aGYAwVZxjX72OFt1k1MsrKNoOXrH//RwOnOg0U7EeABj/kvavHPSkk8
 yV+cmuGPHVo7zMwwK6MqgzxRSGRFOeOolfGGWUTVN+OGVikfgGodwd6wgw2STroo3vSEi0f0N
 guhlNqubJZ8U8/GGSG6VcHFsgfHQ4hgHINOVeH8rD7uRyIhLUcoXG8DultL2IX+eLLZdR9YSa
 lVAl3wnTuz32NvbYG2QRJJIOfkR9xM4+1s07amkXgryvsjs2WuQVXQISWNZ9UtaMlXyPTGPtS
 8jc6JeLgarVHGA2b9w9wyZj6WLnPIRsAjcGUc4hV+2r6BRwtRK/T5R+dfjY95Ery+qTwmd5ex
 FM+ZCvFaAR49OzH/vyGi68iltvxFX57f0uuvYzDYIowIk7PLVjSwv2OyEfhKS7FBpnGFDZmAi
 aHN2lKULoUfSx8/4IVCNR/TYQtpdnfqczQOJWXAMzsLzaYcLSNFeggWlG9IVJAGR+8XYbgKCp
 yBGkoof25hJhQVISvyoH8HxlRj5iROIqdWMQveT1oEO55M/biXw1RqfAaL+a4olv+n8smqe1u
 sRYihOa0R4sI93Tbdo6IVbw4bm3NiKWrR1WgDs8F3ouCvc/YxuDfl720Ytr5q40pZySNFE1VM
 u3UfwDo9IGjclHEkvgD6RUJfotH23cZ4LAUkWER9Vb5RSXGU46KjMON+Z7hGU39BWVafgE8A0
 I8RVuZmb1WPu6TE5h2tJAHDgkQ0=

Many Uniwill-based devices do not supports the already existing
charge limit functionality, but instead support an alternative
interface for controlling the battery charge algorithm.

Add support for this interface and update the documentation.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../admin-guide/laptops/uniwill-laptop.rst    |  19 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 243 ++++++++++++++----
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   5 +-
 3 files changed, 215 insertions(+), 52 deletions(-)

diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index 1f3ca84c7d88..24b41dbab886 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -46,11 +46,20 @@ Battery Charging Control
 .. warning:: Some devices do not properly implement the charging threshol=
d interface. Forcing
              the driver to enable access to said interface on such device=
s might damage the
              battery [1]_. Because of this the driver will not enable sai=
d feature even when
-             using the ``force`` module parameter.
-
-The ``uniwill-laptop`` driver supports controlling the battery charge lim=
it. This happens over
-the standard ``charge_control_end_threshold`` power supply sysfs attribut=
e. All values
-between 1 and 100 percent are supported.
+             using the ``force`` module parameter. The charging profile i=
nterface will be
+             available instead.
+
+The ``uniwill-laptop`` driver supports controlling the battery charge lim=
it. This either happens
+over the standard ``charge_control_end_threshold`` or ``charge_types`` po=
wer supply sysfs attribute,
+depending on the device. When using the ``charge_control_end_threshold`` =
sysfs attribute, all values
+between 1 and 100 percent are supported. When using the ``charge_types`` =
sysfs attribute, the driver
+supports switching between the ``Standard``, ``Trickle`` and ``Long Life`=
` profiles.
+
+Keep in mind that when using the ``charge_types`` sysfs attribute, the EC=
 firmware will hide the
+true charging status of the battery from the operating system, potentiall=
y misleading users into
+thinking that the charging profile does not work. Checking the ``current_=
now`` sysfs attribute
+tells you the true charging status of the battery even when using the ``c=
harge_types`` sysfs
+attribute (0 means that the battery is currently not charging).
=20
 Additionally the driver signals the presence of battery charging issues t=
hrough the standard
 ``health`` power supply sysfs attribute.
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index d4abcaf87e39..e11b6c8aeb0d 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -254,6 +254,10 @@
=20
 #define EC_ADDR_OEM_4			0x07A6
 #define OVERBOOST_DYN_TEMP_OFF		BIT(1)
+#define CHARGING_PROFILE_MASK		GENMASK(5, 4)
+#define CHARGING_PROFILE_HIGH_CAPACITY	0x00
+#define CHARGING_PROFILE_BALANCED	0x01
+#define CHARGING_PROFILE_STATIONARY	0x02
 #define TOUCHPAD_TOGGLE_OFF		BIT(6)
=20
 #define EC_ADDR_CHARGE_CTRL		0x07B9
@@ -320,13 +324,15 @@
 #define UNIWILL_FEATURE_SUPER_KEY		BIT(1)
 #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
 #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
-#define UNIWILL_FEATURE_BATTERY			BIT(4)
-#define UNIWILL_FEATURE_CPU_TEMP		BIT(5)
-#define UNIWILL_FEATURE_GPU_TEMP		BIT(6)
-#define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
-#define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
-#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
-#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
+#define UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT	BIT(4)
+/* Mutually exclusive with the charge limit feature */
+#define UNIWILL_FEATURE_BATTERY_CHARGE_MODES	BIT(5)
+#define UNIWILL_FEATURE_CPU_TEMP		BIT(6)
+#define UNIWILL_FEATURE_GPU_TEMP		BIT(7)
+#define UNIWILL_FEATURE_PRIMARY_FAN		BIT(8)
+#define UNIWILL_FEATURE_SECONDARY_FAN		BIT(9)
+#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
+#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
=20
 enum usb_c_power_priority_options {
 	USB_C_POWER_PRIORITY_CHARGING =3D 0,
@@ -339,8 +345,15 @@ struct uniwill_data {
 	struct regmap *regmap;
 	unsigned int features;
 	struct acpi_battery_hook hook;
-	unsigned int last_charge_ctrl;
 	struct mutex battery_lock;	/* Protects the list of currently registered =
batteries */
+	union {
+		struct {
+			/* Protects writes to last_charge_type */
+			struct mutex charge_type_lock;
+			enum power_supply_charge_type last_charge_type;
+		};
+		unsigned int last_charge_ctrl;
+	};
 	bool last_fn_lock_state;
 	bool last_super_key_enable_state;
 	bool last_touchpad_toggle_enable_state;
@@ -447,6 +460,12 @@ static inline bool uniwill_device_supports(const stru=
ct uniwill_data *data,
 	return (data->features & features) =3D=3D features;
 }
=20
+static inline bool uniwill_device_supports_any(const struct uniwill_data =
*data,
+					       unsigned int features)
+{
+	return data->features & features;
+}
+
 static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigned=
 int val)
 {
 	union acpi_object params[2] =3D {
@@ -1421,6 +1440,30 @@ static int uniwill_led_init(struct uniwill_data *da=
ta)
 							 &init_data);
 }
=20
+static int uniwill_read_charge_type(struct uniwill_data *data, enum power=
_supply_charge_type *type)
+{
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
+	if (ret < 0)
+		return ret;
+
+	switch (FIELD_GET(CHARGING_PROFILE_MASK, value)) {
+	case CHARGING_PROFILE_HIGH_CAPACITY:
+		*type =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
+		return 0;
+	case CHARGING_PROFILE_BALANCED:
+		*type =3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
+		return 0;
+	case CHARGING_PROFILE_STATIONARY:
+		*type =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
+		return 0;
+	default:
+		return -EPROTO;
+	}
+}
+
 static int uniwill_get_property(struct power_supply *psy, const struct po=
wer_supply_ext *ext,
 				void *drvdata, enum power_supply_property psp,
 				union power_supply_propval *val)
@@ -1431,6 +1474,16 @@ static int uniwill_get_property(struct power_supply=
 *psy, const struct power_sup
 	int ret;
=20
 	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		/*
+		 * We need to use the cached value here because the charging mode
+		 * reported by the EC might temporarily change when a external power
+		 * source has been connected.
+		 */
+		mutex_lock(&data->charge_type_lock);
+		val->intval =3D data->last_charge_type;
+		mutex_unlock(&data->charge_type_lock);
+		return 0;
 	case POWER_SUPPLY_PROP_HEALTH:
 		ret =3D power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_PRESENT=
, &prop);
 		if (ret < 0)
@@ -1479,13 +1532,52 @@ static int uniwill_get_property(struct power_suppl=
y *psy, const struct power_sup
 	}
 }
=20
+static int uniwill_write_charge_type(struct uniwill_data *data, enum powe=
r_supply_charge_type type)
+{
+	unsigned int value;
+
+	switch (type) {
+	case POWER_SUPPLY_CHARGE_TYPE_TRICKLE:
+		value =3D FIELD_PREP(CHARGING_PROFILE_MASK, CHARGING_PROFILE_STATIONARY=
);
+		break;
+	case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
+		value =3D FIELD_PREP(CHARGING_PROFILE_MASK, CHARGING_PROFILE_HIGH_CAPAC=
ITY);
+		break;
+	case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
+		value =3D FIELD_PREP(CHARGING_PROFILE_MASK, CHARGING_PROFILE_BALANCED);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(data->regmap, EC_ADDR_OEM_4, CHARGING_PROFILE_=
MASK, value);
+}
+
+static int uniwill_restore_charge_type(struct uniwill_data *data)
+{
+	guard(mutex)(&data->charge_type_lock);
+
+	return uniwill_write_charge_type(data, data->last_charge_type);
+}
+
 static int uniwill_set_property(struct power_supply *psy, const struct po=
wer_supply_ext *ext,
 				void *drvdata, enum power_supply_property psp,
 				const union power_supply_propval *val)
 {
 	struct uniwill_data *data =3D drvdata;
+	int ret;
=20
 	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		mutex_lock(&data->charge_type_lock);
+
+		ret =3D uniwill_write_charge_type(data, val->intval);
+		if (ret >=3D 0)
+			data->last_charge_type =3D val->intval;
+
+		mutex_unlock(&data->charge_type_lock);
+
+		return ret;
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		if (val->intval < 0 || val->intval > 100)
 			return -EINVAL;
@@ -1501,21 +1593,41 @@ static int uniwill_property_is_writeable(struct po=
wer_supply *psy,
 					 const struct power_supply_ext *ext, void *drvdata,
 					 enum power_supply_property psp)
 {
-	if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		return true;
-
-	return false;
+	default:
+		return false;
+	}
 }
=20
-static const enum power_supply_property uniwill_properties[] =3D {
+static const enum power_supply_property uniwill_charge_limit_properties[]=
 =3D {
 	POWER_SUPPLY_PROP_HEALTH,
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
 };
=20
-static const struct power_supply_ext uniwill_extension =3D {
+static const struct power_supply_ext uniwill_charge_limit_extension =3D {
 	.name =3D DRIVER_NAME,
-	.properties =3D uniwill_properties,
-	.num_properties =3D ARRAY_SIZE(uniwill_properties),
+	.properties =3D uniwill_charge_limit_properties,
+	.num_properties =3D ARRAY_SIZE(uniwill_charge_limit_properties),
+	.get_property =3D uniwill_get_property,
+	.set_property =3D uniwill_set_property,
+	.property_is_writeable =3D uniwill_property_is_writeable,
+};
+
+static const enum power_supply_property uniwill_charge_modes_properties[]=
 =3D {
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
+	POWER_SUPPLY_PROP_HEALTH,
+};
+
+static const struct power_supply_ext uniwill_charge_modes_extension =3D {
+	.name =3D DRIVER_NAME,
+	.charge_types =3D BIT(POWER_SUPPLY_CHARGE_TYPE_TRICKLE) |
+			BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
+			BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),
+	.properties =3D uniwill_charge_modes_properties,
+	.num_properties =3D ARRAY_SIZE(uniwill_charge_modes_properties),
 	.get_property =3D uniwill_get_property,
 	.set_property =3D uniwill_set_property,
 	.property_is_writeable =3D uniwill_property_is_writeable,
@@ -1531,7 +1643,13 @@ static int uniwill_add_battery(struct power_supply =
*battery, struct acpi_battery
 	if (!entry)
 		return -ENOMEM;
=20
-	ret =3D power_supply_register_extension(battery, &uniwill_extension, dat=
a->dev, data);
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
+		ret =3D power_supply_register_extension(battery, &uniwill_charge_limit_=
extension,
+						      data->dev, data);
+	else
+		ret =3D power_supply_register_extension(battery, &uniwill_charge_modes_=
extension,
+						      data->dev, data);
+
 	if (ret < 0) {
 		kfree(entry);
 		return ret;
@@ -1560,7 +1678,10 @@ static int uniwill_remove_battery(struct power_supp=
ly *battery, struct acpi_batt
 		}
 	}
=20
-	power_supply_unregister_extension(battery, &uniwill_extension);
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
+		power_supply_unregister_extension(battery, &uniwill_charge_limit_extens=
ion);
+	else
+		power_supply_unregister_extension(battery, &uniwill_charge_modes_extens=
ion);
=20
 	return 0;
 }
@@ -1570,27 +1691,36 @@ static int uniwill_battery_init(struct uniwill_dat=
a *data)
 	unsigned int value, threshold;
 	int ret;
=20
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
-		return 0;
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))=
 {
+		ret =3D regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
+		if (ret < 0)
+			return ret;
=20
-	ret =3D regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
-	if (ret < 0)
-		return ret;
+		/*
+		 * The charge control threshold might be initialized with 0 by
+		 * the EC to signal that said threshold is uninitialized. We thus
+		 * need to replace this value with 100 to signal that we want to
+		 * take control of battery charging. For the sake of completeness
+		 * we also set the charging threshold to 100 if the EC-provided
+		 * value is invalid.
+		 */
+		threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
+		if (threshold =3D=3D 0 || threshold > 100) {
+			FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
+			ret =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
+			if (ret < 0)
+				return ret;
+		}
+	} else if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_=
MODES)) {
+		ret =3D devm_mutex_init(data->dev, &data->charge_type_lock);
+		if (ret < 0)
+			return ret;
=20
-	/*
-	 * The charge control threshold might be initialized with 0 by
-	 * the EC to signal that said threshold is uninitialized. We thus
-	 * need to replace this value with 100 to signal that we want to
-	 * take control of battery charging. For the sake of completeness
-	 * we also set the charging threshold to 100 if the EC-provided
-	 * value is invalid.
-	 */
-	threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
-	if (threshold =3D=3D 0 || threshold > 100) {
-		FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
-		ret =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
+		ret =3D uniwill_read_charge_type(data, &data->last_charge_type);
 		if (ret < 0)
 			return ret;
+	} else {
+		return 0;
 	}
=20
 	ret =3D devm_mutex_init(data->dev, &data->battery_lock);
@@ -1609,10 +1739,13 @@ static int uniwill_notifier_call(struct notifier_b=
lock *nb, unsigned long action
 {
 	struct uniwill_data *data =3D container_of(nb, struct uniwill_data, nb);
 	struct uniwill_battery_entry *entry;
+	int ret;
=20
 	switch (action) {
 	case UNIWILL_OSD_BATTERY_ALERT:
-		if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
+		if (!uniwill_device_supports_any(data,
+						 UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
+						 UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
 			return NOTIFY_DONE;
=20
 		mutex_lock(&data->battery_lock);
@@ -1623,10 +1756,24 @@ static int uniwill_notifier_call(struct notifier_b=
lock *nb, unsigned long action
=20
 		return NOTIFY_OK;
 	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
-		if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY=
))
+		if (!uniwill_device_supports_any(data,
+						 UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+						 UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
 			return NOTIFY_DONE;
=20
-		return notifier_from_errno(usb_c_power_priority_restore(data));
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_MODES)=
) {
+			ret =3D uniwill_restore_charge_type(data);
+			if (ret < 0)
+				return notifier_from_errno(ret);
+		}
+
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY)=
) {
+			ret =3D usb_c_power_priority_restore(data);
+			if (ret < 0)
+				return notifier_from_errno(ret);
+		}
+
+		return NOTIFY_OK;
 	case UNIWILL_OSD_FN_LOCK:
 		if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
 			return NOTIFY_DONE;
@@ -1810,7 +1957,7 @@ static int uniwill_suspend_touchpad_toggle(struct un=
iwill_data *data)
=20
 static int uniwill_suspend_battery(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT)=
)
 		return 0;
=20
 	/*
@@ -1887,11 +2034,15 @@ static int uniwill_resume_touchpad_toggle(struct u=
niwill_data *data)
=20
 static int uniwill_resume_battery(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
-		return 0;
=20
-	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL=
_MASK,
-				  data->last_charge_ctrl);
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
+		return uniwill_restore_charge_type(data);
+
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
+		return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTR=
L_MASK,
+					  data->last_charge_ctrl);
+
+	return 0;
 }
=20
 static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
@@ -1970,7 +2121,7 @@ static struct platform_driver uniwill_driver =3D {
=20
 static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __in=
itdata =3D {
 	.features =3D UNIWILL_FEATURE_SUPER_KEY |
-		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -1981,7 +2132,7 @@ static struct uniwill_device_descriptor lapac71h_des=
criptor __initdata =3D {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
-		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -1993,7 +2144,7 @@ static struct uniwill_device_descriptor lapkc71f_des=
criptor __initdata =3D {
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
 		    UNIWILL_FEATURE_LIGHTBAR |
-		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -2579,7 +2730,7 @@ static int __init uniwill_init(void)
=20
 	if (force) {
 		/* Assume that the device supports all features except the charge limit=
 */
-		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY;
+		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHAR=
GE_LIMIT;
 		pr_warn("Enabling potentially unsupported features\n");
 	}
=20
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform=
/x86/uniwill/uniwill-wmi.c
index 31d9c39f14ab..f1b89bc63df6 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-wmi.c
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
@@ -48,6 +48,7 @@ int devm_uniwill_wmi_register_notifier(struct device *de=
v, struct notifier_block
 static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *obj)
 {
 	u32 value;
+	int ret;
=20
 	if (obj->type !=3D ACPI_TYPE_INTEGER)
 		return;
@@ -56,7 +57,9 @@ static void uniwill_wmi_notify(struct wmi_device *wdev, =
union acpi_object *obj)
=20
 	dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
=20
-	blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NULL);
+	ret =3D blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NUL=
L);
+	if (notifier_to_errno(ret) < 0)
+		dev_err(&wdev->dev, "Failed to handle event %u\n", value);
 }
=20
 /*
=2D-=20
2.39.5

