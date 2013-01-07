From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: acer-wmi: fix obj is NULL but dereferenced
Date: Mon, 7 Jan 2013 14:32:11 +0300
Message-ID: <20130107113210.GA29782@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:41662 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753680Ab3AGLcO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 7 Jan 2013 06:32:14 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli.kernel@gmail.com
Cc: platform-driver-x86@vger.kernel.org

Hello Lee, Chun-Yi,

The patch 727651bf738b: "acer-wmi: fix obj is NULL but dereferenced" 
from Dec 14, 2012, leads to the following warning:
drivers/platform/x86/acer-wmi.c:1227 WMID_set_capabilities()
	 warn: calling kfree() when 'out.pointer' is always NULL.

  1217          obj = (union acpi_object *) out.pointer;
  1218          if (obj) {
  1219                  if (obj->type == ACPI_TYPE_BUFFER &&
  1220                          (obj->buffer.length == sizeof(u32) ||
  1221                          obj->buffer.length == sizeof(u64))) {
  1222                          devices = *((u32 *) obj->buffer.pointer);
  1223                  } else if (obj->type == ACPI_TYPE_INTEGER) {
  1224                          devices = (u32) obj->integer.value;
  1225                  }
  1226          } else {
  1227                  kfree(out.pointer);
  1228                  return AE_ERROR;
  1229          }

I was going to remove the kfree() but looking the patch which introduced
it causes GCC warnings and so there is some other stuff which needs to
be fixed as well.

regards,
dan carpenter
