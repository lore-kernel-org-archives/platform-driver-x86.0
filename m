From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] platform/x86: acer-wmi: mark expected switch fall-throughs
Date: Thu, 5 Jul 2018 15:42:21 -0500
Message-ID: <20180705204221.GA11336@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: platform-driver-x86.vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Warning level 2 was used: -Wimplicit-fallthrough=2

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/platform/x86/acer-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 8952173..114b028 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1018,6 +1018,7 @@ static acpi_status WMID_get_u32(u32 *value, u32 cap)
 			*value = tmp & 0x1;
 			return 0;
 		}
+		/* else: fall through */
 	default:
 		return AE_ERROR;
 	}
@@ -1344,6 +1345,7 @@ static acpi_status get_u32(u32 *value, u32 cap)
 			status = AMW0_get_u32(value, cap);
 			break;
 		}
+		/* else: fall through */
 	case ACER_WMID:
 		status = WMID_get_u32(value, cap);
 		break;
@@ -1386,6 +1388,7 @@ static acpi_status set_u32(u32 value, u32 cap)
 
 				return AMW0_set_u32(value, cap);
 			}
+			/* else: fall through */
 		case ACER_WMID:
 			return WMID_set_u32(value, cap);
 		case ACER_WMID_v2:
@@ -1395,6 +1398,7 @@ static acpi_status set_u32(u32 value, u32 cap)
 				return wmid_v2_set_u32(value, cap);
 			else if (wmi_has_guid(WMID_GUID2))
 				return WMID_set_u32(value, cap);
+			/* else: fall through */
 		default:
 			return AE_BAD_PARAMETER;
 		}
-- 
2.7.4
