From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1] platform/mellanox: mlxbf-pmc: Add Mellanox BlueField
 PMC driver
Date: Mon, 27 Jul 2020 13:53:50 +0300
Message-ID: <CAHp75Vdsw61-uNi2TiR7F4j0s=F6XCnQC_j81hXfyJ9tfeq8QA@mail.gmail.com>
References: <0bad52e6e10ff2e8d8a19f95bab7642ec5e71838.1595838334.git.sramani@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0bad52e6e10ff2e8d8a19f95bab7642ec5e71838.1595838334.git.sramani@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shravan Kumar Ramani <sramani@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 27, 2020 at 12:02 PM Shravan Kumar Ramani
<sramani@mellanox.com> wrote:
>
> The performance modules in BlueField are present in several hardware
> blocks and each block provides access to these stats either through
> counters that can be programmed to monitor supported events or
> through memory-mapped registers that hold the relevant information.
> The hardware blocks that include a performance module are:
>  * Tile (block containing 2 cores and a shared L2 cache)
>  * TRIO (PCIe root complex)
>  * MSS (Memory Sub-system containing the Memory Controller and L3 cache)
>  * GIC (Interrupt controller)
>  * SMMU (System Memory Management Unit)
> The mlx_pmc driver provides access to all of these performance modules
> through a hwmon sysfs interface.

Just brief comments:
- consider to revisit header block to see what is really necessary and
what can be dropped
- add comma to the arrays where last line is not a termination
- look at match_string() / sysfs_match_string() API, I think they can
be utilised here
- UUID manipulations (esp. with that GUID_INIT() against non-constant)
seems too much, consider refactoring and cleaning up these pieces
- use kstroto*() API instead of sscanf. It has a range check


-- 
With Best Regards,
Andy Shevchenko
