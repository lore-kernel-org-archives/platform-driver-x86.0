From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] platform/x86: Add custom surface3 platform device for
 controlling LID
Date: Thu, 12 Jan 2017 17:09:58 +0300
Message-ID: <20170112140958.GA1457@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:38601 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750876AbdALOKX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2017 09:10:23 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: benjamin.tissoires@redhat.com
Cc: platform-driver-x86@vger.kernel.org

Hello Benjamin Tissoires,

The patch 3dda3b3798f9: "platform/x86: Add custom surface3 platform
device for controlling LID" from Nov 25, 2016, leads to the following
static checker warning:

	drivers/platform/x86/surface3-wmi.c:168 s3_wmi_check_platform_device()
	error: uninitialized symbol 'ts_adev'.

drivers/platform/x86/surface3-wmi.c
   140  static int s3_wmi_check_platform_device(struct device *dev, void *data)
   141  {
   142          struct acpi_device *adev, *ts_adev;
   143          acpi_handle handle;
   144          acpi_status status;
   145  
   146          /* ignore non ACPI devices */
   147          handle = ACPI_HANDLE(dev);
   148          if (!handle || acpi_bus_get_device(handle, &adev))
   149                  return 0;
   150  
   151          /* check for LID ACPI switch */
   152          if (!strcmp(ACPI_BUTTON_HID_LID, acpi_device_hid(adev))) {
   153                  s3_wmi.pnp0c0d_adev = adev;
   154                  return 0;
   155          }
   156  
   157          /* ignore non SPI controllers */
   158          if (strncmp(acpi_device_bid(adev), SPI_CTL_OBJ_NAME,
   159              strlen(SPI_CTL_OBJ_NAME)))
   160                  return 0;
   161  
   162          status = acpi_walk_namespace(ACPI_TYPE_DEVICE, handle, 1,
   163                                       s3_wmi_attach_spi_device, NULL,
   164                                       &ts_adev, NULL);
                                              ^^^^^^^
It's complaining about if this function fails.

   165          if (ACPI_FAILURE(status))
   166                  dev_warn(dev, "failed to enumerate SPI slaves\n");
   167  
   168          if (!ts_adev)
   169                  return 0;
   170  
   171          s3_wmi.touchscreen_adev = ts_adev;
   172  
   173          return 0;
   174  }

regards,
dan carpenter
