From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 0/1] platform/x86: mlx-platform: mlxcpld-hotplug driver notes
Date: Wed, 14 Dec 2016 12:05:14 +0000
Message-ID: <1481717115-60362-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, andriy.shevchenko@linux.intel.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch contains the non-functional fixes, pointed out by Andy.
I was waiting with sending the patch until the patch which moves
mlx-platform driver from arch/x86/platform/mellanox to
drivers/platform/x86 folder is accepted.
Now after the below patches are committed to the testing branch:
platform/x86: mlx-platform: Move module from arch/x86 is committed.
platform/x86: mlx-platform: Add mlxcpld-hotplug driver registration
 a15e902e1a00715edc09bd1862e27f84f0a86fda
 4065133df054abf4f7f41bdc15af0c7a1fd66d71
 6b45a3612118878ab4f221ce49997e67687ef588
I'd like to apply the comments pointed out by Andy:
  - Make names of hotplug devices shorter;
  - Change register offset assignment to defines;
  - Add defines for the all event masks;
  - Use PLATFORM_DEVID_NONE instead of -1;

Vadim Pasternak (1):
  platform/x86: mlx-platform: mlxcpld-hotplug driver style fixes

 drivers/platform/x86/mlx-platform.c | 84 ++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 34 deletions(-)

-- 
2.1.4
