Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975963;
	b=bdJ20CQYZ5gCY8BVVPaI5ExlEp5bUK9VI5NpKhaRbWRijDUt/UHw60GagudDU7I2z7AO
	 4COXofuyWc9GJsNQo+5D7fJLEGv0PDeJ1qHJb2aTRvXvqRYphrjh3x1wJa7BeXdjMF1oo
	 D8tE5+yKY0LfGlS7Devh8rx1wHxjgUjisOuwHaXSu0KUvpdZ0b7OHJ2GQpg/FpQpKwke5
	 RU4DtAu63DW0HKfATNzclkfIiNd9bIKbPyLOh4sMBapNVk2IQ9UoQxsHx0sdb8E5qtBUe
	 HP9o1A21xYfuaCK57FKWv67EJrJNLE2dWJvyiQOK8uyVe+Yw7RdJ3M8MoGhk9INzrkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bkAUl2VeHuBxxFP8euDGKJ7YU7PKBdgaMZN7gE5S3K4=;
	b=n7uMAgQfLkTpxg17++bc6ffHLcXCXSs6KVEylxBIE2IMopGzVUTPFcOmHXo7Lm885E6l
	 QxOw3x9HQBmIc9xVn4q/8xZlF7zYoUMz0f+dQXGavWBTLZNpksEa61xSIBJ2oBmcLFJ7e
	 N8Rj9w4UdJeGXbPLyLf4JyIRsOGbZNua5VKiz/y9vixHUPxFzFCFWJKO3LFxHwdAN0cLX
	 +0igQAd88PsYF/3W60mF0acyPrXwHMMwKYYuk9CP3to95UFt0cgR+cfkz0p18F2boj89w
	 9u0YCGdBZCjNC/M95pcat40/QQNqcqm9UouSOTDpGOg0PZkawsbKtwoF/MbEUoYFYzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0qdZlS7;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD448606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD448606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0qdZlS7
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ea7987517aso3273725ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975962; x=1795580762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bkAUl2VeHuBxxFP8euDGKJ7YU7PKBdgaMZN7gE5S3K4=;
        b=L0qdZlS7lcZxY7Xyb0VQIFwLsW+sYXJLss+sSJVFywaQemeIRf61uImm13FUqplLtg
         zYKISaqZ5JoXv1LZ9sAJAV0T3+HTrviuxeiIXRCNFjF7zZnq4A6whxKcCvLomKE19hRN
         BW06U09K6w2kvIE3JJEClV5SSBeeUFWoHQiH55Lrrq8v0PK7KgGeIJWx49wZ2U82BB7/
         Dln87fzRRqXPs4inLqt4wWvAoWaBTmFjAFt6Wotfhn4i8yU0qSBmqUj9YyUjRK47GMPd
         vLIkJxCsWwjXnJueSEqKkNFatc5VI7Z5rne70grvUd5X0HwTEESo5GFuI9m5fF2iS+9j
         GWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975962; x=1795580762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bkAUl2VeHuBxxFP8euDGKJ7YU7PKBdgaMZN7gE5S3K4=;
        b=tW9xuSZlBnodAZVoQIb78uR0ugYH2xBO+PMC02Ui8/HwqbEL/vD2V1n6RneRCgU9fB
         NkdJ+jbODuJVvaKQUFTLizv/r9qRIy0ND86GX5jfmpFkMHAapzH0tPOoKyDqHSVuw2qO
         FgpmkkwBWoaSNEIAN6Ll/Vwf4Vz3Y5BsoNavGcfs9N/ZXwu14Tj8hztyRLfPHf+TkkCG
         tab1LER1sMjUiIid8jjkkMw/d6cZaUlsmvB1L9BUkpYhm/qhUMq+necP/+sVYOXz/Ths
         8zUPOkHIzApC0RxA4dsnHAiebNjEaaRzDEdX0L4IheD+vPgIbvpEwEUkdfMos2NPdCq2
         xydg==
X-Gm-Message-State: APuU4Z+U7N++xNTcETv2AyDLrT+zLqosA9XFf+mxNN7B3JG4XX3RGuQG
	kY0VOUy+OOLgCyXNIo7xOQLe2DJoPC7Z1dtRt5TJAQI4U+zKIZMTKKqe
X-Gm-Gg: AZFdTZd7aX661SprOxz2HFVyJ51qGW7YLLDsUGDgt761Ol6RD3hhpldW8m16ymUnZLa
	qH6iEZ3kOy7zr2m01k5nlIeBra/UAtKeJBbbx87bQWVLXvJVq/e3AL4UrOGs7zabsLgJxpo2IQm
	YVeAsXMczjnn7WP9l04bHrJAx277UrxjzIZ3ykEsGQM3TSJUmSS/6K/HRUcyqyRer9GVcrbRz6T
	/yfF3qrQy82+U6nXpb+dTtJQNXuVtNJr6V1lD5mNDrf07OLzmAIOF+LpnzIlljNkurQxNO7+5cR
	ORD8AdNw/Hqtqx05Kzu4vGBSTw5MlImQeFdJr+qkKpRSQwWvoOUzm2eqiuRr5X+/zUtwS3o4Jh2
	wnwGAGCUHfA3U9S278XhxGA7vWbK1KyhJiTzJ0B2CNA9ihOiFcrLzym6S8VqEeXvxyxXgID4pc4
	qaayuSnYoW1zUx+TjWykx0FuxmEVexwwu08ORSMjFChfzfdjMeJFS++0LkbWaLYHVmSuyhwMv53
	XlT5nDlObGz+2EoQ6CNDmCD0ijf65pRMKggAo4QUMh7osoMiT5waZb6DA0cXi8S0N9UqeEabuHA
	byXrK2NU8pjy77eUzCOEWe4LC8Xb4hO5Q3r2PSs4Zo9ZUtoYtathQQMyvXFj9JVDqLhxq8VYTjV
	cxX+m5v1BY5h8Ze9Nf6Bwbt0tJc0J5Jefgjj/pExhSKFqCvs9JlNbHAikFr5h+yNt+XrC5pCYCy
	adCg==
X-Received: by 2002:a17:902:fc43:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eff754ba26mr12416785ad.59.1794975962195;
        Tue, 17 Nov 2026 20:26:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:26:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 15/16] platform/x86: dell-smbios: Restrict token sysfs files with their mode
Date: Tue, 17 Nov 2026 20:25:37 -0800
Message-ID: <dd638c07f5771298ceb064b3aa92d853a67f4a43.1794975827.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794975827.git.rosenp@gmail.com>
References: <cover.1794975827.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The token location and value files are world-readable and check
capable(CAP_SYS_ADMIN) on every read. Checking capabilities in a sysfs
show() callback tests the credentials of whoever reads, not whoever
opened the file, and the permissions shown by ls do not match what is
enforced.

Make the files 0400 and drop the check. Only root can still read them,
but an unprivileged open now fails with -EACCES instead of a read
failing with -EPERM.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index f98658d3c7cf..8770f2e22442 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -500,9 +500,6 @@ static ssize_t location_show(struct device *dev,
 {
 	struct token_sysfs_data *data = container_of(attr, struct token_sysfs_data, location_attr);
 
-	if (!capable(CAP_SYS_ADMIN))
-		return -EPERM;
-
 	return sysfs_emit(buf, "%08x", data->token->location);
 }
 
@@ -511,9 +508,6 @@ static ssize_t value_show(struct device *dev,
 {
 	struct token_sysfs_data *data = container_of(attr, struct token_sysfs_data, value_attr);
 
-	if (!capable(CAP_SYS_ADMIN))
-		return -EPERM;
-
 	return sysfs_emit(buf, "%08x", data->token->value);
 }
 
@@ -561,7 +555,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
 
 		sysfs_attr_init(&token_entries[i].location_attr.attr);
 		token_entries[i].location_attr.attr.name = location_name;
-		token_entries[i].location_attr.attr.mode = 0444;
+		token_entries[i].location_attr.attr.mode = 0400;
 		token_entries[i].location_attr.show = location_show;
 		token_attrs[j++] = &token_entries[i].location_attr.attr;
 
@@ -575,7 +569,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
 
 		sysfs_attr_init(&token_entries[i].value_attr.attr);
 		token_entries[i].value_attr.attr.name = value_name;
-		token_entries[i].value_attr.attr.mode = 0444;
+		token_entries[i].value_attr.attr.mode = 0400;
 		token_entries[i].value_attr.show = value_show;
 		token_attrs[j++] = &token_entries[i].value_attr.attr;
 	}
-- 
2.56.1

