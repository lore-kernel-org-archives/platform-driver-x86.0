Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C7042586D;
	Mon, 20 Jul 2026 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553583; cv=none; b=sr7OK2gWBoDGGBq5LIVXUyd/UDLXaLbfXBcMfjq2L8oQxVwsGkHDr4vE+KZ66jaieOR+6QfxvDsfanH3/GsbTnjbDvwvG8i4wsLuT8F9m+pPr1TCkVGPFoaFeKM7k56z8stlPOfE7tnFN2SSB85G5p7ECBpVn4Y/N/xePYUweiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553583; c=relaxed/simple;
	bh=o/KqYHO5yn22TXW6oyoCtUMpaI5VX591xQjG9/Ke7nI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uM9SFrbN3sTVjO/3e7mok1RXSeskxyyZr2rzqVjIcHuARUAs5D2M7ac9BV0msPuNa/irQ2WSb32Wy4czCQK8oGYBh8ZXr3OxCdMljapsuVEZObSNqhG0Zh3i63Xx7Vjegc/vZuk9m1k1abqV1N2styzsFVWrnMsTafyraTlL5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pSBAwixo; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pSBAwixo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784553576; x=1785158376; i=w_armin@gmx.de;
	bh=2khWy3rw0ryrygHs5dcvFVqMH93WMOZAaHjTR8ZQYa4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pSBAwixoSamR6EP7+EgBlOCnEwuctmWkxgKWFSppvTnNe96Nu0n1ELd7xj3KdWN+
	 dUOumwCTy1PHz94KB38w5Dh/4EeKBxCbetusAn5ZDcVo372ubPScVt742weyQM+kp
	 9+Xl2kp7yBLq9Ilt+7/6ebhjqBi5fh1KdV3hDzYowS3sVwfigGecb+2JFYsS2BwB2
	 yRM46FXhyzLcg/NR9cEm/kH1X8bh3VYt3DmuVxRsULWNR1wqnclRePxoDx1p+5Zx0
	 37BA26s05N6coWBAdUvKrnzB4+OXtMC5UzCm3Lp+AAOmeLUBUr58toMAikhm3OY0Q
	 q09iGf2JnJhh3sJQEg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Mj-1xKrsC3TH9-00nxcx; Mon, 20
 Jul 2026 15:19:35 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: Dell.Client.Kernel@dell.com,
	shuangpeng.kernel@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de
Subject: [PATCH v2 3/3] platform/x86: dell-smbios-wmi: Replace global list with single item
Date: Mon, 20 Jul 2026 15:19:21 +0200
Message-Id: <20260720131921.368000-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720131921.368000-1-W_Armin@gmx.de>
References: <20260720131921.368000-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c1T9HLSKKMHqBGB4cJh/BQc0KTlp2zNQRYzzVKLfSbzKOaUst4k
 jl5p9J+qw5YLgTnR2lfIn09qJ8C0qtCS0/+M7eZXDbssk7Frpo7IRHDrZQ6Khn5G/2w3pYl
 o7J0BbukASnoVhR8b/f+kOxJTjSXfiIX2zfzL8FsCgvS8nL9/Wbyh5CPp4LjZpX+/bYuQri
 BTtCtnOv7bCTgcwMh7Wow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p2HiYbAiQG0=;ztPQetTXIgNf62eZ1neDliE0avL
 a2pfehnfJXZxeGm+L7LiDJ8VX3vXGkEbtpHpAhQp+YiGBvwblQg4Rg065dI9u7bEqI//5VNbC
 r3SQPyqOy5EIsUqN4mfrw+2Ub6wqqNeFONrXoSwlRx1WlmkTBzOHq0K+21Xf+jz3dO+WZuFeq
 vJ3W0wK8ABcRAcsVapYA9y8waZ4HXWOyN+vKPz1Ob9kzlH1TFuW9ptOXwtYRwMuunhlvK7Ow0
 cjCp+XV50d2X3aU1Up64PGZ2yb5lydJbkwXF0SFkjtX1hoI7vBVRxNBM0GXtnGZ+lIecUNPAM
 ZdMpWIsWurUqO6Xz1/RnQjCbzUA2YPFFAV3pDOCNCKPFECDsdr52kjmsGFz+fvg3hy7JuxNUI
 JjBoZId7pu72lHYIppuoX7mirbtkFnv+LsBjVxMsFuPENIGUhCxHc3pi278QYyOJUaG7KFvVX
 +ab/6zRhI/doyp0Po1VSibDEsOChw4HJLIND7052LEEXVYBAhEoPNJJSugqCNSTICUS6EWpA1
 1HUp99FvLYFhKpFsFIsgO93r4CmGJEhKfXJbG2DG5Q2KTIoNN09HsJySx09fZmLs0qoKgxEFR
 D8VitNfpnEhCKplHhrGs3B1xeJKXCJPNA2Gq2NJi1MgF7K+R45+8Xmx5qM+8YXe1tWHc5tLbz
 wETRfDHbFZoS0loCj2jFHF/vxOd40teA0B58oxLUMV0Pvahmq/2haXsOY/bQXy7ooQoPy41Vi
 9KKyCzAPjngDjG0f9wReoDa9XTPR9XFdG+ZYpui3KqvCY58kCRFm3nWdI1z3bQSDM318C5afk
 AWy6rw3YjXmj7sA/sCASIWgRB93uaa8S6UU9nkZJnLcntyrFa0wtsQ+3a7++p8OLXe26kHUis
 7Zxd8MDtJ4KnDWG57X2KBmGHErBgegzLB2N5Hl2m8YcZvG6/rtNoKotHSawE4k8AINQ2h3cgb
 jkGE53Il0y95imwSU/6EXJAkdKdf0ohNtNBXJJc7KxSXv2iOECvAabRshs0gnhOqbCQVw4PRw
 mnG1Rztn0Z9/xqhJ0oJBFqRMMB2JO/QXOvoj9Hx/cgyRsQqniauKqJ+pw0eTK7czSEKqgtr4m
 qGGWZiPMWnj1SaF1c4Z7DPUDi30faDw9DNDTE2ShKgQwZFc1B+KO81kuhSp9TFE62QQrYE1xd
 T7chUjIS2ucljwNZN6q9B/4X8UbNWqEb02ts9UEBVA7k256Qp+1hEPjb7+ihOFsyPnlGd2z6A
 VdHDgWUYcvGBFP0SXL+zRSf2P1piiQPzfP8TD2okDTIyxYugYeE36NPHRZ5/DYgEg7aEq1+Xp
 RP5Ui2syXfCYyFMsAQehLmkYOUdjuScSdlCjfjBGlSAcnYm0sSopyMpE1SQ6puEZGA3s5MsED
 uiZaoAeKCEtRdmNcjEEyk7MNFcR3EYu9fBMWj6OZ/OgdMVTxZ1RiC/6AGjyKAxbfqVhxzMtys
 wOJjToePPJcLrj8Rfr8I/ivgdFYUmaBYyt6LYxGrN4jfEaofaBDab+LWSUZ9KCZGefx/oQXm+
 bjIv4H9XVmCjMoILJuKHuBbp2bWUqCtoboh67EJ7p7c5L0ZAlLUelyguNTCOzAjp7uVBM91JB
 b3xMehTCzAjMIBfHhCPsDKAOaHJjumN3xntvlIprsoUwEF4DQQ8B2z2z9mRooQrg3cCLnzNWi
 llKxFAp9bs12GfeK+y1/dgOvNDAmMuiazqBUKyWqfiPn4SRFhyDLqIZ85w9LwJFcROqPLYvRd
 aHB75MD7U9OiwqjVd6EHRG8EnP96mp+J6dtvb2Z2OzQkLC7Wy9coyHpAUSOvzmUYyJ7PTYSa2
 ZwblVI95aHnMSgmPKDat7DWBnLebegbk1ftWHjuunSx3xoFGmYrwhd9n5O74Ge6OblKbDWmo+
 YW1QAGO/9MsFKMR9WD6jgttJFOecbIzbkTHvKW5PJAudz59YOrsOATIaC8yQLYgSvslT7tqW9
 +ASLVkVgseX2voI2KNGfoNMIDyWCP1qwhQECCTDNZQf4rHZCnlLSzfuI4ti6kuMmicp71/eF3
 uMUkxp9OmgeSIqhfrYQPdCfMbbuAxpxHZlchVXbo6TtRMPxqoBPVUwWk7bxe+USKHeuKKq41w
 h8hpahGRw7dcX9/0hpJx04QLhtRMFd/dIkFKZW6tTUzlgmk4sPgpQ6c8Nu1D2v5hx1A9XdoAU
 1X3f/kiVyp5MEWSWz36D1wEKfepqNGB7f+veR6Gw/HzMG20DaNVprCgymqdxfKXBsaPqLU2Sk
 8lRln4IfDb145rD/oFOlskk6b6Q75lh6BKBtkKxoU4Cfusv8yqvaoRAQ0SLgCdhwz1fT1x0/O
 rr3gLoQ9XSLevUJfK7p9Yv0D/xIJNMgdxZTTq4Np7eoNfQ1apLyUouC/Qc6mF3SKNUNyUx3j4
 NCKzyUepjIi+wuvbG21H2foeau1hZjzFLaEQjqRNwehsey+IpXrWeA5vmo0ZQDPENKNpcklpp
 p43H5J41zz7AlJMqaKOinjK2smiaJHmFW4imgFVCqFwTsnzbfzYA4o1WhC/dza+s2Ubl09DYG
 S8IeQghQ5HZ4wOOU+/K6oE8hCCp8ccUd5XfEtDffTBwmYKb0WASuZ0QW/9hFdw0PS8aDx+NbB
 Ic95WBe1819OlTjl6Yk2Z+MbzlRBfcl6PFxb35dcXQ2XFrVS12CODDWPOBa5nhrmb7Qs4SFrO
 Bk1x1TRK4yyFDhjU72+6+xUKvXTjid9WpxB8iKX0caEDOQYtwEYixqO+taG61/ofTXPMldb+x
 m9SH1JHJOskeKHd0bN8FZlRZnP1ey+8KSnCqQhDnFCiYpgDdroa5qVmEFO7iBZlallBIEoQO6
 vS3nW3A8X5ddMfBJnbz9ffc69JO6D0kpjxGhOOcbJHreynKPUyJPsCZIne/+CTus8zQbB0TAI
 i4Tt7l/ijy80CESlKhGuf4uZUtxCLFBn1o/RNVFhEbtpMepNFbe1rbmPyxTAaePfa0nSpH7Hn
 52x8lvjoX/12Dh1lpKTP29vjP/1h7M+5BuWB/lNKtbB1aH7u5g75lxTnNm0BKvR9z9K2DkeVx
 T8JvRcFEN15T6uZCFed96jml2vK3iSHarLIwm/3r2Ja8Ah8R1zS7/2zNlmy/lFC9DnultINqa
 Zb3aPxVVvc5c/CVVF6S9tMi+vCJp4qBZtdUn3xeHTPhrKbcEfXAIkhMAnowlGDlK1Z642Y987
 d5bvj4G6EsGZhkRVrzm6DjlBbu5zU2mVjXaI32sC06zV7seq6Q/z8yW/cVfk2PNK6IcPWaTal
 gGPxenNU6YAMcyjicX/7ba508ChnKFNR9dJtmvrg1hoJ6PUHHsDh429wLl8Ti0B8eBw4o7xCR
 6F0uwQNKxeTdbTCcF88bzdcwFab1zln8XIAiQ50YUO54bg/QvCWgqOGbQ7mB0MXJUrgegLK1x
 i9BmSYxt57gqVHrL07ckqDUWDZ9E9v4RwkLQ4GsPJZnpHWYMDbX1GWDC7nmiekGQuJ7oPT9HF
 YsJDDgkShmUGtLJSVyDXnhB2jALLIGiHDb3k9+82GsYQOiAQkHwimH9n/lRRZgbVXfUEs2O+2
 KLlxvvY/zGsgKdlfmdISLNn2n3oexsRggL/2GPGuVqQLkJnp518w9gTsdcEAV/fIWZwTshiS1
 H6QkzUHWvMiGAAm4vr0P3o88k7v3M62fQz+dt8b3W+NIUtGF3js3gApsCKM5N54F7Rdek2w+L
 bvJbaG8gl4pCykIFoKZUpOCF0kOAQTrIo2LrOZfoeikARsN1QPx5Fi4v+i4M/7J+YpGWB/kuO
 dK9N39ZGDQqynQHpnwKGn5WkOUMeoo4cMU594dlV0UO+vQmDc+id84+d/RKbBkpyYC+njHIX1
 CZ10iN5aXN67zomLBLVdU0XQYTK+e7rYaaE3jfUEDgV0Znsn7CQFwSzYTuUPJ95aeatBFNZLr
 k9kgARcOr5SSilv5y7E0VIeNrZd7+1DkFtNfT/nraUnAlIqPAeDbvb1PVyY84WOuFTaG4CXT+
 NRaRqIB9TPCOkds0RKXWJSfPYKkstB0cYcBq8S+pGQpbu0rHYnrB75ICng1GZrYF7SQ+Qppvc
 2duRZE6HvSfgtO6ntfIJ8B72iw3kmOUqPxbtKncL6zAaBb/VStq6sjSdUvREFGq8olCBAu/YK
 3ZGINZAz7xtWD+yXO5RmRgcfoBBdQhJnMohVj6mpiw10aYrXiqElVpExVjZ2F60re6MtM9QiM
 pSzxX0d3ToLyBysDyFYOPaSHJCbIHKwIEoqpl+7J4XJ3+9PGMLvpAVWEwzZoQ9AGVpRWo92oL
 +FaQysJ8SkqZzEkXZLSiuRoeVMTHhhu2Ay9GKWoQfoTCs+Kh8fAanxi2DQIEMON8ynFI9n/xV
 VUX06bkEitEshwPi0lHIkYaDWsPm3wjgUms3XDSTxKYhsSgMjW9cHZemy+zvn6AM0L6jEn0kx
 8mvh7V3HEeJxoQ7XTHyFRRMvbenEPyl/Gnhcb04C3Bqqugw4oTQmKOf0V0BWhkVXJth+k1mQc
 k3xR/lyG5Ekg0FQdiKhL6ctE+26XRQKcMPIUBth4svJjCdgZYYGmf3JJ1seJROY7/hARRgVp7
 rwtePmHpug88X/S4NtjLAbcO60bG138nmXksK8jt1Uy6e/SjqVoP9SYi7/FnGR7fWiBmdid6u
 VZCw/nkVo6qKNr5whpm2jDNhGjKcBXxw0+33Pebn7sds0O+FYquBvsEbTpR6D2l+kvWm5eM7q
 Pqv8PXPJXYT9WjKuk9UHv/V8/89P743165ziJObv2nGNux4ZzEo1uln/vA/C1NcnDuhTHrcY/
 zQAvJ/g/vGYvE3FHas/BB+4CjwTgpqs+oLBSGftgaZq6PVI7vM1NVjRnErNaZ9acVKWHsqZE0
 Qw4AzJItH3QgbM6TZChWGJYnwrqrPDnibvYt6nbHc7ySDTOLLNM0f7afewp4IkO9wsjn7AHLu
 vjruIeXX+CQmIxNEQLS5o1gLPBmDEL14sgCnQ8HViDXxkFhbREHcRqCetdR05UY1GGMCV6VKf
 MwaTmsP++bvT9Lu+NNZlWyHpr+UnOkB0ugnAGr/Zr6TAjQwMo5tkoP9lFAtmHbwPcpzQGYsTB
 iRfHvjykvXEYedd5ADEJfI5sPLnF+lX97dBzkPfpU8PWRYDJkOdZiKgqkrv9KM8jAUcf5GuRo
 sKiaJyMplRmpBh/kYZQtkpSIhaXP0BPHsS7n97FtEvfNN1uPgY2oPkuGoBTdRNQEBfcfk4Yro
 R/9/21ZH6y+bnJ5IVuaO9SWfalq2N+50+vSxQpOgTXiH7UWh38wJs2/2+AQ3rMyIGyUJ3BDMS
 p0YUsy8p6HIPnnMVSnPAdQeu1mjkMudNE9cd07OY3ks9MkvR8OdpUthsITsGfNGl8uqqozbhA
 f0ZkuPTwEtd+/7dKDiB4Wvktd3eB6r4dAjYFB2tpHeRgbAoDijBdotYUd9vnDfb9mkFraD2k9
 4p+GePAAbWWEqHChioKw17ne59Cj4zgiKn79wiakuHVYC5TCSj5CCkJ9FABvAmwLb0g94FlbR
 PSsiWbpb2lCYYG7XDFF0cZ4iD80G/8qvU4nV/IahWjLkfbGOzM5b0sU5mkqMAWqWB1IkW6WzR
 ySuTTNLzojNgoQJVA3TB1g7IgoEieGKF7m1nPO6axa20MTdL1MPxE4HDw08l1MxeOo7pfK9i5
 DH3GEHZS/tbAXxIsJaRTOJE/wA7uHHJDcuBI8udCV6QEpWQPtmSVOgbGzFlEfvLQMjyMLsDZT
 cAX5GXBXRQcXUZbbBAAQ4LmsNTIumdevKkrLUwmBVNZ3zxQJLzJJicaaahU9H+FKIwJj6Dp/F
 PyjrUkC3bM/7SZA410aRkkxuyshHGUyRW981TOQ8hB8Rh1hATgZu5chPN4L6tAYToQ8RbeWjT
 hMjyeLOck5dd

There can only exist a single instance of the dell-smbios-wmi driver
at the same time because of naming conflicts with the character
device ("wmi/dell-smbios"). Having a global list for all instances
thus makes no sense.

Replace the global list with a single item used by the character
device. This simplifies the driver and allows us to mark it as
being multi-instance safe.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-smbios-wmi.c | 68 ++++++++++-----------
 1 file changed, 31 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platfor=
m/x86/dell/dell-smbios-wmi.c
index 2108de4e48a3..f9443ddfff55 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -10,7 +10,6 @@
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/fs.h>
-#include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -34,22 +33,14 @@ struct misc_bios_flags_structure {
 struct wmi_smbios_priv {
 	struct mutex call_lock; /* Protects the content of the SMBIOS buffer */
 	struct dell_wmi_smbios_buffer *buf;
-	struct list_head list;
 	struct wmi_device *wdev;
 	struct device *child;
 	u64 req_buf_size;
 	struct miscdevice char_dev;
 };
=20
-static DECLARE_RWSEM(list_lock);	/* Protects access to wmi_list */
-static LIST_HEAD(wmi_list);
-
-static inline struct wmi_smbios_priv *get_first_smbios_priv(void)
-{
-	return list_first_entry_or_null(&wmi_list,
-					struct wmi_smbios_priv,
-					list);
-}
+static DECLARE_RWSEM(chardev_lock);	/* Protects chardev_priv */
+static struct wmi_smbios_priv *chardev_priv;
=20
 static int run_smbios_call(struct wmi_device *wdev)
 {
@@ -106,16 +97,13 @@ static int dell_smbios_wmi_call(struct device *dev, s=
truct calling_interface_buf
 static ssize_t dell_smbios_wmi_read(struct file *filp, char __user *buffe=
r, size_t length,
 				    loff_t *offset)
 {
-	struct wmi_smbios_priv *priv;
+	guard(rwsem_read)(&chardev_lock);
=20
-	guard(rwsem_read)(&list_lock);
-
-	priv =3D get_first_smbios_priv();
-	if (!priv)
+	if (!chardev_priv)
 		return -ENODEV;
=20
-	return simple_read_from_buffer(buffer, length, offset, &priv->req_buf_si=
ze,
-				       sizeof(priv->req_buf_size));
+	return simple_read_from_buffer(buffer, length, offset, &chardev_priv->re=
q_buf_size,
+				       sizeof(chardev_priv->req_buf_size));
 }
=20
 static long dell_smbios_wmi_do_ioctl(struct wmi_smbios_priv *priv,
@@ -159,20 +147,18 @@ static long dell_smbios_wmi_do_ioctl(struct wmi_smbi=
os_priv *priv,
 static long dell_smbios_wmi_ioctl(struct file *filp, unsigned int cmd, un=
signed long arg)
 {
 	struct dell_wmi_smbios_buffer __user *input =3D (struct dell_wmi_smbios_=
buffer __user *)arg;
-	struct wmi_smbios_priv *priv;
=20
 	if (cmd !=3D DELL_WMI_SMBIOS_CMD)
 		return -ENOIOCTLCMD;
=20
-	guard(rwsem_read)(&list_lock);
+	guard(rwsem_read)(&chardev_lock);
=20
-	priv =3D get_first_smbios_priv();
-	if (!priv)
+	if (!chardev_priv)
 		return -ENODEV;
=20
-	guard(mutex)(&priv->call_lock);
+	guard(mutex)(&chardev_priv->call_lock);
=20
-	return dell_smbios_wmi_do_ioctl(priv, input);
+	return dell_smbios_wmi_do_ioctl(chardev_priv, input);
 }
=20
 static const struct file_operations dell_smbios_wmi_fops =3D {
@@ -189,10 +175,29 @@ static void dell_smbios_wmi_unregister_chardev(void =
*data)
 	misc_deregister(char_dev);
 }
=20
+static void dell_smbios_wmi_clear_chardev(void *data)
+{
+	guard(rwsem_write)(&chardev_lock);
+
+	chardev_priv =3D NULL;
+}
+
 static int dell_smbios_wmi_register_chardev(struct wmi_smbios_priv *priv)
 {
 	int ret;
=20
+	scoped_guard(rwsem_write, &chardev_lock) {
+		/* We can only have a single chardev at a time */
+		if (chardev_priv)
+			return -EBUSY;
+
+		chardev_priv =3D priv;
+	}
+
+	ret =3D devm_add_action_or_reset(&priv->wdev->dev, dell_smbios_wmi_clear=
_chardev, NULL);
+	if (ret < 0)
+		return ret;
+
 	priv->char_dev.minor =3D MISC_DYNAMIC_MINOR;
 	priv->char_dev.name =3D "wmi/dell-smbios";
 	priv->char_dev.fops =3D &dell_smbios_wmi_fops;
@@ -256,24 +261,12 @@ static int dell_smbios_wmi_probe(struct wmi_device *=
wdev, const void *context)
 	if (ret)
 		return ret;
=20
-	ret =3D dell_smbios_register_device(&wdev->dev, 1, &dell_smbios_wmi_call=
);
-	if (ret)
-		return ret;
-
-	guard(rwsem_write)(&list_lock);
-	list_add_tail(&priv->list, &wmi_list);
-
-	return 0;
+	return dell_smbios_register_device(&wdev->dev, 1, &dell_smbios_wmi_call)=
;
 }
=20
 static void dell_smbios_wmi_remove(struct wmi_device *wdev)
 {
-	struct wmi_smbios_priv *priv =3D dev_get_drvdata(&wdev->dev);
-
 	dell_smbios_unregister_device(&wdev->dev);
-
-	guard(rwsem_write)(&list_lock);
-	list_del(&priv->list);
 }
=20
 static const struct wmi_device_id dell_smbios_wmi_id_table[] =3D {
@@ -311,6 +304,7 @@ static struct wmi_driver dell_smbios_wmi_driver =3D {
 	.probe =3D dell_smbios_wmi_probe,
 	.remove =3D dell_smbios_wmi_remove,
 	.id_table =3D dell_smbios_wmi_id_table,
+	.no_singleton =3D true,
 };
=20
 int init_dell_smbios_wmi(void)
=2D-=20
2.39.5

