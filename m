From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] asus-wireless: Toggle airplane mode LED
Date: Sat, 18 Feb 2017 23:30:59 +0300
Message-ID: <20170218203059.GA23566@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aserp1050.oracle.com ([141.146.126.70]:38092 "EHLO
        aserp1050.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753492AbdBRUco (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Feb 2017 15:32:44 -0500
Received: from aserp1040.oracle.com (aserp1040.oracle.com [141.146.126.69])
        by aserp1050.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id v1IKWH0x010930
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Feb 2017 20:32:20 GMT
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jprvita@gmail.com
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net

Hello João Paulo Rechi Vita,

The patch 2c1a49c96123: "asus-wireless: Toggle airplane mode LED"
from Jun 13, 2016, leads to the following static checker warning:

	drivers/platform/x86/asus-wireless.c:54 asus_wireless_method()
	error: uninitialized symbol 'ret'.

drivers/platform/x86/asus-wireless.c
    33  static u64 asus_wireless_method(acpi_handle handle, const char *method,
    34                                  int param)
    35  {
    36          struct acpi_object_list p;
    37          union acpi_object obj;
    38          acpi_status s;
    39          u64 ret;
    40  
    41          acpi_handle_debug(handle, "Evaluating method %s, parameter %#x\n",
    42                            method, param);
    43          obj.type = ACPI_TYPE_INTEGER;
    44          obj.integer.value = param;
    45          p.count = 1;
    46          p.pointer = &obj;
    47  
    48          s = acpi_evaluate_integer(handle, (acpi_string) method, &p, &ret);

"ret" isn't necessarily initialized on a couple error paths through this
function.

    49          if (ACPI_FAILURE(s))
    50                  acpi_handle_err(handle,
    51                                  "Failed to eval method %s, param %#x (%d)\n",
    52                                  method, param, s);
    53          acpi_handle_debug(handle, "%s returned %#x\n", method, (uint) ret);
    54          return ret;
    55  }

regards,
dan carpenter
