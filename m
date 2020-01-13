From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH platform-next v2 05/10] Documentation/ABI: Add new
 attribute for mlxreg-io sysfs interfaces
Date: Mon, 13 Jan 2020 16:13:46 +0200
Message-ID: <CAHp75VdTfZHFNrMq4pAVFY6OZWHDXMnEwa4pqWcG2v05MWVzvA@mail.gmail.com>
References: <20200112121849.7056-1-vadimp@mellanox.com> <20200112121849.7056-6-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200112121849.7056-6-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jan 12, 2020 at 2:19 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
> Add documentation for the new attributes for:
> - Exposing reset causes types asserted by: platform reset, SoC reset,
>   AC power failure, software power off request.
> - Setting and removing system VPD (EEPROM) hardware write protection.
> - Voltage regulator devices configuration update status and firmware
>   version.
> - Setting PCIe ASIC reset to disable or enable state during PCIe root
>   complex reset.
> - System static topology identification, like system's static I2C
>   topology, number and type of FPGA devices within the system and so on.
>

Same comments as per previous patch (style related)

-- 
With Best Regards,
Andy Shevchenko
