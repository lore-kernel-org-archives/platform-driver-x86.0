From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/2] ACPI / scan: Create platform device for CPLM3218 ACPI nodes
Date: Sun, 26 Apr 2020 12:47:11 +0200
Message-ID: <20200426104713.216896-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi All,

Here is a patch series to deal with the way jow the CM3281
ambient-light-sensor is described in the ACPI tables of Asus
T100TA and T100CHI devices:

 Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
 {
     Name (SBUF, ResourceTemplate ()
     {
         I2cSerialBusV2 (0x000C, ControllerInitiated, 0x00061A80,
             AddressingMode7Bit, "\\_SB.I2C3",
             0x00, ResourceConsumer, , Exclusive,
             )
         I2cSerialBusV2 (0x0048, ControllerInitiated, 0x00061A80,
             AddressingMode7Bit, "\\_SB.I2C3",
             0x00, ResourceConsumer, , Exclusive,
             )
         Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
         {
             0x00000033,
         }
     })
     Return (SBUF) /* \_SB_.I2C3.ALSD._CRS.SBUF */
 }

Notice that the first entry is the SMBus Alert Response Address, this
is actually somewhat useful as on this sensor we must read a byte
from that address once to clear an alert which seems to be set on
power-on; and without doing this the sensor will not respond on its
actual address. Taking care of this is left up to the cm32181 driver
(I will Cc you on the patch series for that).

This series uses the i2c-multi-instantiate code to instantiate
i2c-clients for both addresses.

Note this series touches files under both drivers/apci and
drivers/platform/x86. IIRC in the past i2c-multi-instantiate changes
were merged through Rafael's tree because of this.

Andy or Darren may we have your Acked-by for merging this through
Rafael's tree?

Regards,

Hans
