From: Gerhard Wiesinger <lists@wiesinger.com>
Subject: Re: platform/x86/pcengines-apuv2: Missing apu4
Date: Mon, 29 Jul 2019 22:51:13 +0200
Message-ID: <e4d495d5-bd3a-df31-bda3-b69d6d9146a1@wiesinger.com>
References: <02b34d18-27bc-cb48-f698-03df61df7d91@wiesinger.com>
 <343400be-bd86-b59c-cfa0-862780493450@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <343400be-bd86-b59c-cfa0-862780493450@metux.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>, Florian Eckert <fe@dev.tdt.de>, Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 29.07.2019 10:35, Enrico Weigelt, metux IT consult wrote:
> On 26.07.19 16:56, Gerhard Wiesinger wrote:
>> Hello,
>>
>> I saw that the apu4 board is completly missing (also on 5.3rc1). Can 
>> you please add it. Should be very easy, see below.
>
> Still in the pipeline - don't have an apu4 board for testing yet.
>
>
Delta to e.g. apu3 can be found in the repo, see below 
(https://github.com/pcengines/coreboot)


dmidecode|grep -iE 'engines|apu'
         Manufacturer: PC Engines
         Product Name: apu4
         Manufacturer: PC Engines
         Product Name: apu4
         Manufacturer: PC Engines

So risk of the patch is minimal.


I can test it if patch is integrated.

Ciao,

Gerhard

--- pcengines_apu3.config    Fri Jul 26 11:33:41 2019
+++ pcengines_apu4.config    Fri Jul 26 11:33:41 2019
@@ -30,14 +30,14 @@
  #
  CONFIG_VENDOR_PCENGINES=y
  # CONFIG_BOARD_PCENGINES_APU2 is not set
-CONFIG_BOARD_PCENGINES_APU3=y
-# CONFIG_BOARD_PCENGINES_APU4 is not set
+# CONFIG_BOARD_PCENGINES_APU3 is not set
+CONFIG_BOARD_PCENGINES_APU4=y
  # CONFIG_BOARD_PCENGINES_APU5 is not set
  CONFIG_BOARD_SPECIFIC_OPTIONS=y
-CONFIG_VARIANT_DIR="apu3"
+CONFIG_VARIANT_DIR="apu4"
  CONFIG_DEVICETREE="variants/$(CONFIG_VARIANT_DIR)/devicetree.cb"
  CONFIG_MAINBOARD_DIR="pcengines/apu2"
-CONFIG_MAINBOARD_PART_NUMBER="apu3"
+CONFIG_MAINBOARD_PART_NUMBER="apu4"
  # CONFIG_SVI2_SLOW_SPEED is not set
  CONFIG_SVI_WAIT_COMP_DIS=y
  CONFIG_HW_MEM_HOLE_SIZEK=0x200000
@@ -397,7 +397,7 @@
  CONFIG_MAINBOARD_SERIAL_NUMBER="123456789"
  CONFIG_MAINBOARD_VERSION="1.0"
  CONFIG_MAINBOARD_SMBIOS_MANUFACTURER="PC Engines"
-CONFIG_MAINBOARD_SMBIOS_PRODUCT_NAME="apu3"
+CONFIG_MAINBOARD_SMBIOS_PRODUCT_NAME="apu4"

  #
  # Payload
