From: David Cohen <david.a.cohen@linux.intel.com>
Subject: [PATCH v2 03/10] mrst: Fixed checkpatch warnings
Date: Wed,  9 Oct 2013 23:00:00 -0700
Message-ID: <1381384807-14146-4-git-send-email-david.a.cohen@linux.intel.com>
References: <1381384807-14146-1-git-send-email-david.a.cohen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381384807-14146-1-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, platform-driver-x86@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Fixed checkpatch warnings in mrst related files.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: David Cohen <david.a.cohen@linux.intel.com>
---
 arch/x86/platform/mrst/mrst.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/mrst/mrst.c b/arch/x86/platform/mrst/mrst.c
index 235a742..2a45eab 100644
--- a/arch/x86/platform/mrst/mrst.c
+++ b/arch/x86/platform/mrst/mrst.c
@@ -977,7 +977,7 @@ static int __init sfi_parse_devs(struct sfi_table_header *table)
 		case SFI_DEV_TYPE_UART:
 		case SFI_DEV_TYPE_HSI:
 		default:
-			;
+			break;
 		}
 	}
 	return 0;
-- 
1.7.9.5
